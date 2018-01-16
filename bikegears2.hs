{-# OPTIONS_GHC -fwarn-missing-signatures #-}

import Control.Applicative
{-
try with and without the import Control.Applicative
https://hackage.haskell.org/package/base-4.10.0.0/docs/Control-Applicative.html
http://learnyouahaskell.com/making-our-own-types-and-typeclasses#the-functor-typeclass
not sure what is going on here (yet)
-}
bg :: [Double]
bg = (/)  <$> [22.0, 32.0, 42.0] <*> [26, 23, 21, 19, 17, 15, 13, 12]
--                                    [26 23 21 19 17 15 13 12]

main :: IO ()
main =  do
--    print bg
    mapM_ print bg
--    https://stackoverflow.com/questions/6280585/need-to-know-what-and-do-in-haskell
--    print $ (+) <$> (* 10) <$> [1, 2, 3] <*> [4, 5, 6]  -- was (* 10)
--    print $ (+) <$> (/ 10) <$> [1, 2, 3] <*> [4, 5, 6]  --
--    print $ (+) <$>  [1, 2, 3] <*> [4, 5, 6]  --
 

--    print bg
--    print $ fmap (* 0.5) [1..6]

{-
see clojure/bikegears
need to restrict decimal points, sort the output, organise into columns
-}
