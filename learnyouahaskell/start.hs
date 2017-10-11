{-# START_FILE Upcase.hs #-}
module Upcase (upcase) where
import Data.Char
upcase str = map toUpper str
{-# START_FILE Main.hs #-}
import Upcase
main = do
--    contents <- readFile "foo.txt"
    putStrLn $ 6
