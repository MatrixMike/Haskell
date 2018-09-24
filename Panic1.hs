--import Text.Printf

--import Bezier hiding (Point)
--import Graphics.Gloss
--import Graphics.Gloss.Interface.Pure.Game

--mjh
--type Point = [Float]
type Point = (Float,Float)
type Parametric a = Float -> a
head                    :: [a] -> a
head (x:xs)             =  x
{- https://www.haskell.org/tutorial/goodies.html  see 2.1
-}
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
{-http://learnyouahaskell.com/making-our-own-types-and-typeclasses
-}

{-bezier2d :: [Point] -> Parametric Point
bezier2d ps = point2d <$> bezier (list2d <$> ps)
  where
    point2d [x, y] = (x, y)
    list2d (x, y) = [x, y]
  -}  
main :: IO ()
main = print "66"
