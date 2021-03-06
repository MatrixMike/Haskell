{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# OPTIONS_GHC -fwarn-missing-signatures #-}

import Data.ByteString.UTF8 as BSUTF8

-- 08.10.2017 17:30:47
-- 11.10.2017 21:36:05
-- http://learnyouahaskell.com/syntax-in-functions
{-module Main where
-}
{-module Vowel2 
    (
    remVowels,
    remVowelsL
    )
    where 

-}
--import Text.CaseConversion
import Data.Char
import Data.List

toCharacterCase :: Char -> [String] -> String
toCharacterCase c cs = intercalate [c] (map (map toLower) cs)

{-
convert given string to lower case and test each character for vowels
   for each character :
   if vowel then add nothing to o/p string 
    else add character 
-}
remVowels :: Char -> Char
remVowels c
  | c == 'a' = 'x'
  | c == 'e' = 'x'
  | c == 'i' = 'x'
  | c == 'o' = 'x'
  | c == 'u' = 'x'
  | c == 'é' = 'x'
  | otherwise = 'z'

remVowelsL :: Char -> Bool
remVowelsL c
  | c == 'a' = True
  | c == 'e' = True
  | c == 'i' = True
  | c == 'o' = True
  | c == 'u' = True
  | otherwise = False

-- https://stackoverflow.com/questions/38858857/getting-vowels-from-a-string-and-printing-them-in-haskell 
-- https://stackoverflow.com/questions/46364784/haskell-checking-the-vowels-in-a-string?rq=1
-- https://en.wikipedia.org/wiki/Vowel_length
isVowel :: Char -> Bool
isVowel x = x `elem` "aeioué"

isConsonant :: Char -> Bool
isConsonant x = not (x `elem` "aeiou") --want the inverse

vowel :: String -> String
vowel = filter isVowel

consonant :: String -> String
consonant = filter isConsonant

testWord1 :: String
testWord1 = "café"

main :: IO ()
main = do
  print $ remVowels 'a'
  print $ vowel "The cat sat on the mat"
  print $ vowel "Hewitt"
  print $ consonant "Hewitt"
  print testWord1
  print $ vowel testWord1
  print $ consonant testWord1
  print "\233"
  print $ "é"
