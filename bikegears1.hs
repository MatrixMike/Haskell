{-# OPTIONS_GHC -fwarn-missing-signatures #-}

--import Control.Applicative
{-
try with and without the import Control.Applicative
https://hackage.haskell.org/package/base-4.10.0.0/docs/Control-Applicative.html
http://learnyouahaskell.com/making-our-own-types-and-typeclasses#the-functor-typeclass
not sure what is going on here (yet)
-}


import Bglib
import DoubleTest
import Reversew
--import Vowel2 
import Collision
--import SinR   -- I changed SinR from a module to a main

f1 :: [Double]
f1 = [42, 52]

r1 :: [Double]
r1 = [14,17,20,24,28]

bg1 = (/) <$> f1 <*> r1
bg1 :: [Double]

{-bg :: [Double]
bg = (/)  <$> [22.0, 32.0, 42.0] <*> [26, 23, 21, 19, 17, 15, 13, 12]
-}

main :: IO ()
main =  do
--    print bg
    putStrLn ("Dolly wants a cracker" :: String) :: IO ()
    mapM_ print bg
    print "++++"
    mapM_ print bg1
--    https://stackoverflow.com/questions/6280585/need-to-know-what-and-do-in-haskell
--    print $ (+) <$> (* 10) <$> [1, 2, 3] <*> [4, 5, 6]  -- was (* 10)
--    print $ (+) <$> (/ 10) <$> [1, 2, 3] <*> [4, 5, 6]  --
--    print $ (+) <$>  [1, 2, 3] <*> [4, 5, 6]  --
    print [ x/y  |  x <- [22.0, 32.0, 42.0], y <- [26, 23, 21, 19, 17, 15, 13, 12]]
    print [ x/y  |  x <- f1, y <- r1]
-- above is a double list comprehension
--    print bg
--    print $ fmap (* 0.5) [1..6]

{-
see clojure/bikegears
need to restrict decimal points, sort the output, organise into columns
-}
