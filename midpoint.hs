
type Point = (Float,Float)
type PointB = [Float] -- a multi-dimensional coordinate  from Bezier.hs/Bezier code

capacitor :: Double
capacitor = 10e-6 -- 10uF

p1 :: Point
p1 = (2.3,3.02)  -- defining points p1 (x1,y1)

p2 :: Point
p2 = (6.4,7.01)  -- defining points p2 (x2,y2)

ps :: PointB
ps = [6.4,7.01, 2.3,3.02, 9.004,13.2]

points = [(6.4,7.01), (2.3,3.02), (9.004,13.2)]
-- lineM (M for Mike) takes two points and returns the midpoint
--lineM :: Point -> Point -> Point

--lineM :: Float -> Float -> Float
lineD :: Double -> Double -> Double
lineD x1 x2 = (x1 + x2) /2

lineF :: Float -> Float -> Float
lineF x1 x2 = (x1 + x2) /2

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b)  

--addVectorsF :: (Float a) => (a, a) -> (a, a) -> (a, a)  
--addVectorsF a b = (fst a + fst b, snd a + snd b)

--lineMid :: Point -> Point -> Point
--lineMid (x,y) =   (x1+x2)/2  (y1+y2)/2
-- subV (a,b) (c,d) = (a-c,b-d)

main :: IO ()
main = do
    print $ lineD 3.01 9.27
    print $ lineF 3.01 9.27
    print p1
    print p2
    print points
    print ps
    
--    print $ lineD p1
