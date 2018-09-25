--    {-# OPTIONS -Wall -fno-warn-type-defaults #-}
type Point = (Float,Float)
type PointB = [Float] -- a multi-dimensional coordinate  from Bezier.hs/Bezier code
type PointC = [(Float,Float)]
capacitor :: Double
capacitor = 10e-6 -- 10uF

p1 :: Point
p1 = (2.3,3.02)  -- defining points p1 (x1,y1)

p2 :: Point
p2 = (6.4,7.01)  -- defining points p2 (x2,y2)

ps :: PointB
ps = [6.4,7.01, 2.3,3.02, 9.004,13.2]

points :: [(Double, Double)]
points = [(6.4,7.01), (2.3,3.02), (9.004,13.2)]
-- lineM (M for Mike) takes two points and returns the midpoint
--lineM :: Point -> Point -> Point

--lineM :: Float -> Float -> Float
midpD :: Double -> Double -> Double
midpD x1 x2 = (x1 + x2) /2

midpF :: Float -> Float -> Float
midpF x1 x2 = (x1 + x2) /2

midpointN :: (Fractional a) => (a, a) -> (a, a) -> (a, a)  
midpointN a b = ((fst a + fst b)/2.0, (snd a + snd b)/2.0)

type Parametric a = Float -> a -- a value that varies over time
-- linear interpolation between two numbers, from t=0 to t=1
line1d :: Float -> Float -> Parametric Float
line1d a b = \t -> (1 - t) * a + t * b

--line1dT :: line1d
--line1dT = 3.2  4.1 
--addVectorsF :: (Float a) => (a, a) -> (a, a) -> (a, a)  
--addVectorsF a b = (fst a + fst b, snd a + snd b)

--lineMid :: Point -> Point -> Point
--lineMid (x,y) =   (x1+x2)/2  (y1+y2)/2
-- subV (a,b) (c,d) = (a-c,b-d)

main :: IO ()
main = do
    print $ midpD 3.01 9.27
    print $ midpF 3.01 9.27
    print p1
    print p2
    print points
    print ps
    print $ midpointN (1.0,2.0) (2.0,3.0)
    
    
--    print $ lineD p1
