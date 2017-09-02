module Reversew
  ( reverseWords
  ) where
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
reverseWords :: String -> String
reverseWords = unwords . map reverse . words
