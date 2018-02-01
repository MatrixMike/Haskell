{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{- see also outputB.hs
-}
import Middlew
--word = "anotherLongWord1"
--word = "abcdefghi"
word :: [Char]
word = "about"    -- "auobt"

h2 :: Char
h2 = head word

main :: IO ()
main = do
    print $ reverse (middle word)
    putStrLn "starting -> please supply input...on which to perform letter shuffling "
    interact (unlines . map middle . lines)
    putStrLn "finishing..."
