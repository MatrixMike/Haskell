{- Copyright (c) 2013, Peter Ljung <ljung.peter@gmail.com>

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby
granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL,
DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
USE OR PERFORMANCE OF THIS SOFTWARE. -}

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Data.Maybe (maybe, catMaybes, fromJust, isJust, isNothing)
import qualified Data.Map.Strict as Map
import Control.Applicative ((<$>), (<*>))
import System.IO (FilePath)
--import Graphics.Gloss.Juicy

{- Chess game between two human players on a single computere.
   Game rules is verified durint play, but draw and checkmate is not detected.
   Compile: ghc -O2 Chess.hs
   Optimize: strip Chess -o ChessStrip
   Run: ./Chess -}

main = do
         let
           boardWidth = 500
           maxTime = 900
         gfx <- loadGraphics
         play
           (InWindow "Haskell Chess" (600, 650) (0,0))
           white
           5
           (initialState maxTime)
           (drawWorld gfx boardWidth)
           handleEvent
           stepWorld

type BoardWidth = Float
type Board   = Map.Map Pos Piece
type Pos     = (Int, Int)   -- (col, row)
data PColor  = White | Black deriving (Eq, Show)
data PType   = King | Rook | Bishop | Queen | Knight | Pawn deriving (Eq, Show)
data PState  = Init | TwoStep | Moved deriving (Eq, Show)
data Piece   = Piece { ptype :: PType
                     , pcolor :: PColor
                     , pstate :: PState } deriving (Eq, Show)
data Marker  = Marker { position :: Pos
                      , selected :: Maybe Pos }
data Player  = Player { name :: String
                      , timeLeft :: Float
                      , col :: PColor
                      , captured :: [Piece] }
data State  = State { board :: Board
                    , marker :: Marker
                    , whitePlayer :: Player
                    , blackPlayer :: Player
                    , current :: PColor
                    , message :: String }

tBlue =  makeColor8  0 102 255 128
tGreen = makeColor8 51 255   0 128

-- Helpers to handle pieces on the board
setPiece :: Pos -> Piece -> Board -> Board
setPiece = Map.insert

updatePiece :: (Piece -> Piece) -> Pos -> Board -> Board
updatePiece = Map.adjust

getPiece :: Pos -> Board -> Maybe Piece
getPiece = Map.lookup

dropPiece :: Pos -> Board -> Board
dropPiece = Map.delete

movePiece :: Pos -> Pos -> Board -> Board
movePiece from to b = setPiece to p $ dropPiece from b where p = fromJust $ getPiece from b

setMarker :: Pos -> State -> State
setMarker p s = s { marker = (marker s) { position = p } }

setMessage :: String -> State -> State
setMessage m s = s { message = m }

-- Set selected if marker is on a valid piece
setSelected :: Maybe Pos -> State -> State
setSelected Nothing  s = s { marker = (marker s) { selected = Nothing } }
setSelected (Just p) s = if valid then s' else s where
  piece = getPiece p (board s)
  valid = isJust piece && (pcolor (fromJust piece) == current s)
  s' = s { marker = (marker s) { selected = Just p } }

-- Move pos marker, but make sure move is not outside board
movePos :: Pos -> SpecialKey -> Pos
movePos (a,b) KeyLeft  = if (a > 0) then (a-1,b) else (a,b)
movePos (a,b) KeyRight = if (a < 7) then (a+1,b) else (a,b)
movePos (a,b) KeyUp    = if (b > 0) then (a,b-1) else (a,b)
movePos (a,b) KeyDown  = if (b < 7) then (a,b+1) else (a,b)
movePos p     _        = p

-- Move piece according to marker position if valid move. Assumes that a piece has been selected
-- This happen when the user has selected a piece and drop it on a new location
drawPiece :: State -> State
drawPiece s | (isNothing b') = setMessage "Invalid" $ s
            | (isCheck s')   = setMessage "Check"   $ s
            | otherwise      = setMessage ""        $ stepCurrent s' where
  b = board s
  b' = stepBoard b
  s' = s { board = fromJust b' }

  -- Update board state if possible
  stepBoard :: Board -> Maybe Board
  stepBoard b
    | isEnPassant = Just $ movePiece p0 p1 $ dropPiece (fst p1, snd p0) b
    | isPromotion = Just $ movePiece p0 p1 $ updatePiece (promotePiece Queen) p0 b
    | isCapture   = Just $ movePiece p0 p1 $ updatePiece (stepPState p0 p1) p0 b
    | isCastling  = let (r0, r1) = castlingRookMove (p0, p1) in Just $ movePiece r0 r1 $ movePiece p0 p1 b
    | isMove      = Just $ movePiece p0 p1 $ updatePiece (stepPState p0 p1) p0 b
    | otherwise   = Nothing

  (p0, p1) = (fromJust $ selected $ marker s, position $ marker s)
  piece = fromJust $ getPiece p0 b
  capture = getPiece p1 b
  isValid = (pcolor piece == current s) &&
            (distance p0 p1 > 0) &&
            (isJust $ getPiece p0 b)
  isPathClear = pathClear b p0 p1 piece
  isMove = isValid &&
           isPathClear &&
           (isNothing $ getPiece p1 b) &&
           (validMove piece p0 p1)
  isCapture = isValid &&
              isPathClear &&
              (isJust $ capture) &&
              (pcolor $ fromJust $ capture) /= (current s) &&
              (validCapture piece p0 p1)
  isEnPassant = let cpawn = getPiece (fst p1, snd p0) b
                in (isJust cpawn) &&                          -- there's a piece to capture
                   ((pstate $ fromJust cpawn) == TwoStep) &&  -- there's a pawm that has moved TwoStep
                   (validCapture piece p0 p1)
  isPromotion = (isMove || isCapture) &&
                (ptype piece == Pawn) &&                      -- it's a pawn
                (snd p1 == 0 || snd p1 == 7)                  -- move is to final line
  isCastling = let (r0, r1) = castlingRookMove (p0, p1)
                   rook = getPiece r0 b
               in  isValid &&
                   (pathClear b p0 r0 piece) &&               -- check that path is clear
                   (ptype piece == King) &&                   -- check that piece is the king
                   (pstate piece == Init) &&                  -- check that king has not moved
                   (isJust $ rook) &&                         -- check that rook has not moved
                   ((pstate $ fromJust rook) == Init) &&
                   (fst p1 == 2 || fst p1 == 6)               -- check that target square is correct

-- Get rook move from king move in castling
castlingRookMove :: (Pos, Pos) -> (Pos, Pos)
castlingRookMove (p0, p1) = let r = snd p0
                            in  if (fst p0 < fst p1) then ((7, r), (5, r))
                                                     else ((0, r), (3, r))

-- Step PState according to move from a to b
stepPState :: Pos -> Pos -> Piece -> Piece
stepPState a b p = if (ptype p == Pawn && distance a b == 2) then p { pstate = TwoStep } else p { pstate = Moved }

-- Board distance in number of (diagonal or horizontal steps
distance :: Pos -> Pos -> Int
distance (c0, r0) (c1, r1) = max (abs $ c1-c0) (abs $ r1-r0)

-- Check that board is clear between two board positions (either horizontal or diagonal)
pathClear :: Board -> Pos -> Pos -> Piece -> Bool
pathClear b (c0, r0) (c1, r1) p | (ptype p == Knight) = True
                                | (d > 1)             = (length blockers) == 0
                                | otherwise           = True where
  d = distance (c0, r0) (c1, r1)
  (sc, sr) = ((c1-c0) `div` d, (r1-r0) `div` d)
  ps = map (\s -> (c0+(sc*s), r0+(sr*s))) [1..(d-1)]
  blockers = catMaybes $ map (\p -> getPiece p b) ps

-- Check if move piece from a to b is a valid move (assuming an empty board)
validMove :: Piece -> Pos -> Pos -> Bool
validMove (Piece King   _     _) (c0, r0) (c1, r1) = abs (c1-c0) <= 1 && abs (r1-r0) <= 1
validMove (Piece Rook   _     _) (c0, r0) (c1, r1) = (c1-c0) == 0 || (r1-r0) == 0
validMove (Piece Bishop _     _) (c0, r0) (c1, r1) = abs (c1-c0) == abs (r1-r0)
validMove (Piece Queen  _     _)  p0       p1      = validMove (Piece Rook Black Init)   p0 p1 ||
                                                     validMove (Piece Bishop Black Init) p0 p1
validMove (Piece Knight _     _) (c0, r0) (c1, r1) = let (dc, dr) = (abs (c1-c0), abs (r1-r0))
                                                     in  (dc == 1 && dr == 2) || (dc == 2 && dr == 1)
validMove (Piece Pawn   Black _) (c0, r0) (c1, r1) = (c1-c0) == 0 && ( (r1-r0) == 1 || ( (r1-r0) == 2 && r0 == 1 ) )
validMove (Piece Pawn   White _) (c0, r0) (c1, r1) = (c1-c0) == 0 && ( (r0-r1) == 1 || ( (r0-r1) == 2 && r0 == 6 ) )

validCapture :: Piece -> Pos -> Pos -> Bool
validCapture (Piece Pawn Black _) (c0, r0) (c1, r1) = (r1-r0) == 1 && abs (c1-c0) == 1
validCapture (Piece Pawn White _) (c0, r0) (c1, r1) = (r0-r1) == 1 && abs (c1-c0) == 1
validCapture  p                    p0       p1      = validMove p p0 p1

-- Determine if current player is checked. Assumes that the king exist for cur player
isCheck :: State -> Bool
isCheck s = not $ Map.null checkers where
  b = board s
  c = current s
  kingPos = head $ Map.keys $ Map.filter (\p -> ((ptype $ p) == King) &&
                                                ((pcolor $ p) == c)) $ b
  checkers = Map.filterWithKey (\checkerPos p -> (pcolor p /= c) &&
                                                 (pathClear b checkerPos kingPos p) &&
                                                 (validCapture p checkerPos kingPos)) $ b

-- Change current player and clear marker and
stepCurrent :: State -> State
stepCurrent s = s { marker = (marker s) { selected = Nothing }
                 , current = opposite (current s) }
               where
                 opposite col = if col == Black then White else Black

promotePiece :: PType -> Piece -> Piece
promotePiece new p = p { ptype = new }

-- Draw the scene
drawWorld :: [Picture] -> BoardWidth -> State -> Picture
drawWorld gfx bw s =
    translate (-bw*0.5) (-bw*0.55) $ pictures $ [ drawBoard bw
                                   , drawPieces bw gfx (board s)
                                   , drawMarker bw (marker s)
                                   , drawSelected bw (marker s)
                                   , drawState bw s ]

-- Draw board with bottom left corner in origo
drawBoard :: BoardWidth -> Picture
drawBoard w =
    let
      tup a b = (a,b)
      sqAt (c,r) = translate c r $ rectangleSolid 1 1
      squares = (tup <$> [0,2,4,6] <*> [0,2,4,6]) ++ (tup <$> [1,3,5,7] <*> [1,3,5,7])
      border = translate 3.5 3.5 $ rectangleWire 8 8
      blackSquares = map sqAt squares
    in
      color (greyN 0.5) $ scale (w/8) (w/8) $ translate 0.5 0.5 $ pictures $ (border : blackSquares)

drawPieces :: BoardWidth -> [Picture] -> Board -> Picture
drawPieces bw gfx b =
    translate (bw/16) (bw/16) $ pictures $ Map.elems $ Map.mapWithKey (\pos p -> toPic pos p) b
    where
      toPic :: Pos -> Piece -> Picture
      toPic pos p = let (tx, ty) = translatePos bw $ pos
                    in  translate tx ty $ pieceGfx gfx p

-- Draw marker
drawMarker :: BoardWidth -> Marker -> Picture
drawMarker bw m = let (tx, ty) = translatePos bw $ position m
                      marker = color tGreen $ translate tx ty $ thickCircle 27 6
                  in  translate (bw/16) (bw/16) $ marker

-- Draw selected
drawSelected :: BoardWidth -> Marker -> Picture
drawSelected bw m = let sel = selected m
                        (tx, ty) = translatePos bw $ maybe (0,0) id sel
                        selector = color tBlue $ translate tx ty $ thickCircle 27 6
                    in  if (isJust sel) then translate (bw/16) (bw/16) $ selector
                                        else Blank

-- Translete to a board position, assuming that center of bottom, left square is in origo
translatePos :: BoardWidth -> Pos -> (Float, Float)
translatePos bw (c, r) = ((bw/8)*fromIntegral c, (bw/8)*fromIntegral (7-r))

-- Draw current player state
drawState :: BoardWidth -> State -> Picture
drawState bw s =
    let
      col = case (current s) of Black -> black
                                White -> white
      pCurrent = translate (0.5*bw) (1.1*bw)
                   $ pictures [ color col $ rectangleSolid (bw/16) (bw/16)
                              , color black $ rectangleWire (bw/16) (bw/16) ]
      tWhite = round (timeLeft . whitePlayer $ s)
      tBlack = round (timeLeft . blackPlayer $ s)
      pWhite = color (timeColor tWhite)
                 $ translate (0.3*bw) (1.075*bw) $ scale 0.2 0.2
                 $ text $ secFormatted $ tWhite
      pBlack = color (timeColor tBlack)
                 $ translate (0.56*bw) (1.075*bw) $ scale 0.2 0.2
                 $ text $ secFormatted $ tBlack
      secFormatted s = show (s `div` 60) ++ ":" ++ show (s `mod` 60)
      timeColor sec = if (sec < 0) then red else black
      pMessage = color black
                 $ translate (0.05*bw) ((-0.06)*bw) $ scale 0.15 0.15
                 $ text $ (message s)
    in
      pictures $ [pCurrent, pWhite, pBlack, pMessage]

initialState :: Float -> State
initialState timeLeft = State (Map.fromList board) marker white black White "" where
      asBlack t = Piece t Black Init
      asWhite t = Piece t White Init
      atRow r c = (c, r)
      r0 = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
      r1 = [ Pawn, Pawn,   Pawn,   Pawn,  Pawn, Pawn,   Pawn,   Pawn ]
      board = zip (map (atRow 0) [0..7]) (map asBlack r0) ++
              zip (map (atRow 1) [0..7]) (map asBlack r1) ++
              zip (map (atRow 6) [0..7]) (map asWhite r1) ++
              zip (map (atRow 7) [0..7]) (map asWhite r0)
      marker = Marker (0,0) Nothing
      black = Player "Black Player" timeLeft Black []
      white = Player "White Player" timeLeft White []

handleEvent :: Event -> State -> State
handleEvent (EventKey (SpecialKey KeyUp)    Down _ _) s = setMarker (movePos (position . marker $ s) KeyUp) s
handleEvent (EventKey (SpecialKey KeyDown)  Down _ _) s = setMarker (movePos (position . marker $ s) KeyDown) s
handleEvent (EventKey (SpecialKey KeyLeft)  Down _ _) s = setMarker (movePos (position . marker $ s) KeyLeft) s
handleEvent (EventKey (SpecialKey KeyRight) Down _ _) s = setMarker (movePos (position . marker $ s) KeyRight) s
handleEvent (EventKey (SpecialKey KeySpace) Down _ _) s       -- Space toggle selection, or draw piece
    | isNothing sel       = setSelected (Just pos) s
    | pos == fromJust sel = setSelected Nothing s
    | otherwise           = drawPiece s
    where
      sel = selected . marker $ s
      pos = position . marker $ s
handleEvent e s = s

stepWorld :: Float -> State -> State
stepWorld dt s@(State _ _ w _ White _) = s { whitePlayer = w { timeLeft = (timeLeft w - dt) } }
stepWorld dt s@(State _ _ _ b Black _) = s { blackPlayer = b { timeLeft = (timeLeft b - dt) } }

-- Load all graphics used in the game
loadGraphics :: IO [Picture]
loadGraphics = do
                 gfx <- mapM loadJuicy gfxFiles
                 return (catMaybes gfx)

gfxFiles :: [String]
gfxFiles = map (("gfx/"++) . (++"50.png")) $ (map (++"b") fs) ++ (map (++"w") fs) where
           fs = ["k","r","b","q","n","p"]

pieceGfx :: [Picture] -> Piece -> Picture
pieceGfx gfx (Piece t c _) =
    let
      ts = [ King, Rook, Bishop, Queen, Knight, Pawn ]
      color c t = Piece t c Init
      pieces = map (color Black) ts ++ map (color White) ts
      pic = lookup (Piece t c Init) $ zip pieces gfx
    in
      maybe Blank id pic
