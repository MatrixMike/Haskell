module Main (main) where

-- Generalized higher order Bézier approximation in a single point u [0..1]
import Graphics.Gloss.Data.Vector
import Data.List
import Graphics.Gloss


type Bezier = [Point]   -- A linear, quadratic, cubic or higher order Bézier line segment
                        -- E.g. [P1, P2] (linear) or [P1, P2, P3, P4] (cubic)

-- generate pairs from list [e1, e2, ... ] as [(e1,e2), (e2,e3), ... (e(n-1),en)]
make_pairs :: [a] -> [(a,a)]
make_pairs es = let es'  = take (length es - 1) es
                    es'' = drop 1 es
                in zip es' es''
                
-- Helpers
addV :: Vector -> Vector -> Vector
addV (a,b) (c,d) = (a+c,b+d)

subV :: Vector -> Vector -> Vector
subV (a,b) (c,d) = (a-c,b-d)

listify :: (a,a) -> [a]
listify (a,b) = [a,b]

--bezier :: Float -> Bezier -> Vector
bezier u (p1:p2:[]) = p1 + mulSV u (p2 `subV` p1)                 -- linear
bezier u ps         = let pairs = map (listify) $ make_pairs ps   -- quadratic or higher
                      in  bezier u $ (map (bezier u)) $ pairs      
                      
main :: IO ()
main = print "hello"
           
