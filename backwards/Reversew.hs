module Reversew
(
reverseWords
) where

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
