--{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- http://www.lounge.se/wiki2/show/BezierCurves

-- cabal install gloss
module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Data.Vector
import Data.List

{- Bezier curve approximation
   See: http://en.wikipedia.org/wiki/B%C3%A9zier_curve
   Compile: ghc -O2 Bezier.hs
   Run: ./Bezier
 -}

type Bezier = [Point]   -- A linear, quadratic, cubic or higher order Bézier line segment
                        -- E.g. [P1, P2] (linear) or [P1, P2, P3, P4] (cubic)

-- Helpers
addV :: Vector -> Vector -> Vector
addV (a,b) (c,d) = (a+c,b+d)

subV :: Vector -> Vector -> Vector
subV (a,b) (c,d) = (a-c,b-d)

-- generate pairs from list [e1, e2, ... ] as [(e1,e2), (e2,e3), ... (e(n-1),en)]
make_pairs :: [a] -> [(a,a)]
make_pairs es = let es'  = take (length es - 1) es
                    es'' = drop 1 es
                in zip es' es''

listify :: (a,a) -> [a]
listify (a,b) = [a,b]

-- Generalized higher order Bézier approximation in a single point u [0..1]
bezier :: Float -> Bezier -> Vector
bezier u (p1:p2:[]) = p1 + mulSV u (p2 `subV` p1)                 -- linear
bezier u ps         = let pairs = map (listify) $ make_pairs ps   -- quadratic or higher
                      in  bezier u $ (map (bezier u)) $ pairs   

-- Draw Bézier as picture
drawBezier :: Bezier -> Picture
drawBezier ps = let p1 = head ps
                    pn = last ps
                    nsteps = magV ( pn `subV` p1) / 5           -- ~ 5 pixel steps
                    steps = [0, (min 0.5 (1/nsteps)) .. 1]
                    curve = Color green $ Line $ map (`bezier` ps) steps
                    linear = Color blue $ Line [p1, pn]
                    outer = Color (greyN 0.75) $ Line ps
                in pictures [curve, linear, outer]

-- Demo
b0 :: [(Float,Float)]
b0 = [(0,0),(0,100),(250,200),(200,0)]

main = do
 display
--  display (InWindow "Heéllo World" (400, 150) (100, 20)) green picture  -- easily change background colour
   (InWindow "Bézier" (600,600) (100,400))
      orange              -- background
   (draw_bezier b0)

textString :: String
textString = "TeéxtString"
picture :: Picture
picture = Translate (-170) (-20)   -- shift the text to the middle of the window
--    $ Text "World\nTwo"           -- text to display
--   let      secFormatted s = show (s `div` 60) ++ ":" ++ show (s `mod` 60)
    $ Scale 0.5 0.5                -- display it half the original size
    $ Text textString          -- text to display
