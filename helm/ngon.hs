{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-
ngon takes Int and Double and returns something of type Shape.
internally, ngon maps two functions onto a range from 0 to n-1 
producing a list of co-ordinates of the vertices of a polygon
- clever use of lambda - value i used for X and Y

-}
main :: IO()
main = do
--    print  4 
    print $ poly1
    print $ poly2
    print pth
    
poly1 :: Shape
poly1 = ngon 6 2.0

poly2 :: Shape
poly2 = ngon2

ngon2 :: Shape
ngon2 = RectangleShape (1.1,2.2)

{-| Creates a generic n-sided polygon (e.g. octagon, pentagon, etc) with
    an amount of sides and radius. -}
ngon :: Int -> Double -> Shape
ngon n r = PolygonShapeX (map (\i -> (r * sin (t * i), r * sin (t * i))) [0 .. fromIntegral (n - 1)])
  where 
    m = fromIntegral n
    t = 2 * pi / m
--    sinr = r * sin (t * i)      --  i not in scope when used inside map 

{-| A data structure describing a some sort of graphically representable object,
    such as a polygon formed from a list of points or a rectangle. -}
data Shape = PolygonShapeX Path |
             RectangleShape (Double, Double) |
             ArcShape (Double, Double) Double Double Double (Double, Double) deriving (Show, Eq, Ord, Read)

{-| A data type made up a collection of points that form a path when joined. -}
type Path = [(Double, Double)]

pth :: Path
pth = [(1.1,2.2),(3.3,4.4)]

