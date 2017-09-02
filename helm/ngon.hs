{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main :: IO()
main = do
--    print  4 
    print $ poly
    
poly :: Shape
poly = ngon 6 2.0

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


