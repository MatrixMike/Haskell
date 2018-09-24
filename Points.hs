--import Text.Printf

--import Bezier hiding (Point)
--import Graphics.Gloss
--import Graphics.Gloss.Interface.Pure.Game

--mjh
type Point = [Float]
type Parametric a = Float -> a


bezier2d :: [Point] -> Parametric Point
bezier2d ps = point2d <$> bezier (list2d <$> ps)
  where
    point2d [x, y] = (x, y)
    list2d (x, y) = [x, y]
    
