{-# OPTIONS_GHC -fwarn-missing-signatures #-}

import Control.Applicative
{-
try with and without the import Control.Applicative
-}
main :: IO ()
main = print $ (+) <$> (* 10) <$> [1, 2, 3] <*> [4, 5, 6]
