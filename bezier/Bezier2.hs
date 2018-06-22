{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- http://www.lounge.se/wiki2/show/BezierCurves
module Main
  ( main
  ) where

import Data.List
import Graphics.Gloss
import Graphics.Gloss.Data.Vector

{- Bezier curve approximation
   See: http://en.wikipedia.org/wiki/B%C3%A9zier_curve
   Compile: ghc -O2 Bezier.hs
   Run: ./Bezier
 -}
type Bezier = [Point] -- A linear, quadratic, cubic or higher order Bézier line segment
                        -- E.g. [P1, P2] (linear) or [P1, P2, P3, P4] (cubic)

-- Helpers
--addV :: Vector -> Vector -> Vector
--addV (a, b) (c, d) = (a + c, b + d)   -- not needed yet

subV :: Vector -> Vector -> Vector
subV (a, b) (c, d) = (a - c, b - d)

-- generate pairs from list [e1, e2, ... ] as [(e1,e2), (e2,e3), ... (e(n-1),en)]
makePairs :: [a] -> [(a, a)]
makePairs es =
  let es' = take (length es - 1) es
      es'' = drop 1 es
  in zip es' es''    -- what do the '  '' mean?

listify :: (a, a) -> [a]
listify (a, b) = [a, b]

-- Generalized higher order Bézier approximation in a single point u [0..1]
bezier :: Float -> Bezier -> Vector
bezier u (p1:p2:[]) = p1 + mulSV u (p2 `subV` p1) -- linear
bezier u ps =
  let pairs = map listify $ makePairs ps -- quadratic or higher
  in bezier u $ map (bezier u) pairs

-- Draw Bézier as picture
drawBezier :: Bezier -> Picture
drawBezier ps =
  let p1 = head ps   -- list actions head
      pn = last ps   -- list actions last
      nsteps  = magV ( pn `subV` p1) / 5 -- ~ 5 pixel steps
      steps   = [0,(min 0.5 (1 / nsteps)) .. 1]
      curve   = Color green $ Line $ map (`bezier` ps) steps   -- was (\u -> bezier u ps) , now
      linear  = Color red $ Line [p1, pn]  --elements from the list
      linear1 = Color red $ Line [p1, pn]  --elements from the list
            --  try another colour to mid-point between the ends
      outer  = Color (greyN 0.75) $ Line ps
      outer1 = Color (greyN 0.75) $ Line ps
      outer2 = Color (greyN 0.55) $ Line [(0, 0), (0,100), (100, 100), (250, 200), (180, 0)]
      -- pictures seems to take variable number of parameters
  in pictures [curve, linear, outer, outer1, linear1, outer2]  -- as defined in the let above

-- Demo
b0 :: [(Float,Float)]
b0 = [(0, 0), (0,  100), (250,  200), (180, 0)]

b1 :: [(Float,Float)]
b1 = [(0, 0), (0, -100), (250, -200), (180, 0)]


main :: IO ()
main = do
{-  display
    (InWindow "Bézier" (600, 600) (100, 100))
    white -- background
    (draw_bezier b0)
-}
  display
    (InWindow "Bézier" (600, 600) (100, 100))
    yellow -- background
    (drawBezier b1 )
--    (drawBezier b0)

catenary :: Floating a => a -> a -> a
catenary a x = a * cosh ( x / a )
