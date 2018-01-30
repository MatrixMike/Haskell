{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{- see also outputB.hs
-}
import Middlew
--word = "anotherLongWord1"
--word = "abcdefghi"
word :: [Char]
word = "aboutmx"    -- "auobt"

h2 :: Char
h2 = head word

main :: IO ()
main = do
    print $ reverse (middle word)
