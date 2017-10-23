{-# OPTIONS_GHC -fwarn-missing-signatures #-}

--import Control.Applicative
{-
try with and without the import Control.Applicative
https://hackage.haskell.org/package/base-4.10.0.0/docs/Control-Applicative.html
http://learnyouahaskell.com/making-our-own-types-and-typeclasses#the-functor-typeclass
not sure what is going on here (yet)
-}
main :: IO ()
main = do
    print $ (+) <$> (* 10) <$> [1, 2, 3] <*> [4, 5, 6]  -- was (* 10)
    print $ (+) <$> (/ 10) <$> [1, 2, 3] <*> [4, 5, 6]  --
    print $ (+) <$>  [1, 2, 3] <*> [4, 5, 6]  --
    print $ fmap (* 0.5) [1..6]
