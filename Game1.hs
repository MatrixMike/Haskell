--
-- Original author: Alex Greif
--
-- This code heavily based on code here:
-- https://github.com/agreif/hs-helm-samples/tree/master/space_invaders
--
-- Updated for latest version of Helm by Sean Seefried
--


module Game where

import           Control.Arrow
import           Control.Applicative
import           Data.List
import           Helm   -- FRP.Helm
import           FRP.Helm.Time
import qualified FRP.Helm.Window as Window
import qualified FRP.Helm.Keyboard as Keyboard
import qualified FRP.Helm.Mouse as Mouse
import qualified FRP.Helm.Touch as Touch

import           FRP.Elerea.Param hiding (Signal)
import           FRP.Helm.Sample
--
-- Constants
--

--
-- World co-ordinates are a box 100x100 pixels
--

worldWidth :: Double
worldWidth = 100
cannonVelocity, laserVelocity, laserUpperBound :: Double
cannonVelocity  = 50
laserVelocity   = 4
laserUpperBound = 60

cannonWidth, cannonHeight :: Double
cannonWidth     = 10
cannonHeight    = 5


---

data Input =
  Input {
    inpMousePos   :: (Double, Double) -- in world co-ordinates
  , inpMouseDown  :: Bool
  , inpTouches    :: [(Double, Double)] -- in world co-ordinates
  , inpDelta      :: Time
  } deriving (Read, Show, Eq)

data CannonState = CannonState { cx :: Double, cy :: Double
                               , targetX :: Double
                               , lx :: Double, ly :: Double
                               , laserFlying :: Bool
                               } deriving (Read, Show, Eq)

data InvaderState = InvaderState { ix :: Double
                                 , iy :: Double
                                 , color :: Color
                                 , killed :: Bool
                                 , elapsed :: Time
                                 } deriving (Read, Show, Eq)

delta :: Signal Time
delta = fmap inSeconds (fps 35)

gameInput :: Signal Input
gameInput = sampleOn delta <|
          (Input 
           <$> (mouseToWorld <$> Window.dimensions <*> Mouse.position)
           <*> Mouse.isDown
           <*> (map <$> (touchToWorld <$> Window.dimensions) <*> Touch.positions)
           <*> delta)

data Game =
  Game {
    cannon :: CannonState
  , invaders :: [InvaderState]
  }

initialCannon :: CannonState
initialCannon = CannonState { cx = 0, cy = 40
                            , targetX = 0 -- same as cx
                            , lx = 0, ly = 0
                            , laserFlying = False
                            }

initialInvaders :: [InvaderState]
initialInvaders =  concat [row1, row2, row3, row4, row5]
  where
    xposs = [-42, -36 .. 12]
-- mini mod MikeH
    [row1, row2, row3, row4, row5 ] = map createRow (zip [-20,-14..4] [red, blue, blue, green, green])
    -- zip takes two lists and returns a list of corresponding pairs
    createRow :: (Double, Color) -> [InvaderState]
    createRow (yy, color) =
      map (\(x, y) -> InvaderState { ix = x, iy = y, color = color
                                   , killed = False, elapsed = 0}) invaderPoss
        where
          invaderPoss = map (\x -> (x, yy)) xposs


mouseToWorld :: (Int,Int) -> (Int,Int) -> (Double,Double)
mouseToWorld (w,h) (x,y) = (((x'/w') - 0.5)* worldWidth, ((y'/h') - 0.5) * worldWidth)
  where
    x' = fromIntegral x
    y' = fromIntegral y
    w' = fromIntegral w
    h' = fromIntegral h
    

touchToWorld :: (Int,Int) -> (Float,Float) -> (Double,Double)
touchToWorld (w,h) (nx, ny) = ((nx' - 0.5) * worldWidth, (ny' - 0.5) * worldHeight)
  where
    nx' = realToFrac nx
    ny' = realToFrac ny
    w'  = fromIntegral w
    h'  = fromIntegral h
    worldHeight = worldWidth/w'*h'


--
-- True when the mouse is down/touch occurs but not hovered over the cannon
--
shouldFire :: Input -> Bool
shouldFire inp =
  inpMouseDown inp || (not . null $ inpTouches inp)

shouldMoveTo :: Input -> CannonState -> Maybe Double
shouldMoveTo inp s
  | inpMouseDown inp = Just mx
  | otherwise =
      case inpTouches inp of
        (x,_):_ -> Just x
        _       -> Nothing
  where
    mp@(mx,_) = inpMousePos inp

overCannon :: CannonState -> (Double, Double) -> Bool
overCannon s (x,y) =
  x >= cx s - cannonWidth/2 && x <= cx s+ cannonWidth/2 &&
  y >= cy s - cannonHeight/2 && y <= cy s + cannonWidth/2

stepGame :: Input -> Game -> Game
stepGame inp g = g { cannon = cannon', invaders = invaders' }
  where
    cannon' = stepCannon anyKilledByCannon (cannon g)
    (invaders', anyKilledByCannon) = stepInvaders (invaders g)
    stepCannon :: Bool -> CannonState -> CannonState
    stepCannon anyKilledByCannon cs =
      cs { cx = cx', lx = lx', ly = ly', laserFlying = laserFlying', targetX = targetX' }
      where
        targetX' =
          case shouldMoveTo inp (cannon g) of
            Just x  -> x
            Nothing -> targetX cs
        cx' = cx cs + 
          case abs (targetX cs - cx cs) > cannonWidth/2 of -- threshold
            True -> signum (targetX cs - cx cs)*cannonVelocity*(inpDelta inp)
            False -> 0
        laserFlying' = (shouldFire inp && ly cs == 0) ||
                       ((ly cs /= 0 && ly cs < laserUpperBound) && (not anyKilledByCannon))
        lx' | laserFlying' = lx cs
            | otherwise = cx'
        ly' = if laserFlying' then ly cs + laserVelocity else 0

    stepInvaders :: [InvaderState] -> ([InvaderState],Bool)
    stepInvaders ss = id *** any id $ unzip (map stepInvader ss)
    stepInvader :: InvaderState -> (InvaderState, Bool)
    stepInvader s = (invader', killedByCannon)
      where
        invader' =
          s { ix = ix'
            , iy = iy'
            , killed = killed'
            , elapsed = elapsed'
            }
        elapsed' = elapsed s + inpDelta inp
        ix' = ix s
        iy' = iy s
        killedByCannon = not (killed s) && laserFlying (cannon g)
                               && collidesWith (lx (cannon g), lyAbs (cannon g)) (ix', iy')
        killed' = killed s || killedByCannon

lyAbs :: CannonState -> Double
lyAbs cannonState = cy cannonState - 3 - ly cannonState

collidesWith :: (Double, Double) -> (Double, Double) -> Bool
collidesWith (x,y) (x',y') = (x'-x)^2 + (y-y')^2 < collisionRadius^2
  where
    collisionRadius = 4

gameSignal :: Signal Game
gameSignal = foldp stepGame (Game initialCannon initialInvaders) gameInput

cannonForm :: CannonState -> Form
cannonForm state = move (cx state, cy state) $
                           filled red $ rect cannonWidth cannonHeight

laserForm :: CannonState -> Form
laserForm cannonState = move (lx', ly') $
                                filled white $ rect (0.4) (2)
  where lx' = lx cannonState
        ly' = lyAbs cannonState

invaderForm :: InvaderState -> Form
invaderForm s = move ((ix s), (iy s)) $ filled (color s) $ rect (4) (4)

render :: Game -> (Int,Int) -> Element
render g (w,h)=
  centeredCollage w h $ map (scale sf) $
    [cannonForm  (cannon g), laserForm (cannon g)] ++
     map invaderForm liveInvaders
    where
      liveInvaders = filter (not . killed) (invaders g)
      sf = fromIntegral w/worldWidth

game :: Bool -> IO ()
game isMobile = do
  runAndQuitOnSignal config qPressed $ render <~ gameSignal ~~ Window.dimensions
  where
    qPressed = Keyboard.isDown Keyboard.QKey
    config =
      case isMobile of
        True -> defaultConfig { windowIsFullscreen = True }
        False -> 
          defaultConfig { windowTitle = "Space Invaders"
                                 , windowIsFullscreen = False
                                 , windowDimensions = (winWidth, winHeight)}
    (winWidth, winHeight) = (500, 500)

