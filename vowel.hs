{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- 08.10.2017 17:30:47
-- 11.10.2017 21:36:05
-- http://learnyouahaskell.com/syntax-in-functions
module Main where

--import Text.CaseConversion
import Data.Char
import Data.List

toCharacterCase ::   Char -> [String] -> String
toCharacterCase c cs = intercalate [c] (map (map toLower) cs)

{-
convert given string to lower case and test each character for vowels
   for each character :
   if vowel then add nothing to o/p string 
    else add character 
-}
remVowels :: Char -> Char
remVowels c 
           | c =='a' = 'x'
           | c =='e' = 'x'
           | c =='i' = 'x'
           | c =='o' = 'x'
           | c =='u' = 'x'  
           | otherwise  = 'z'
         
remVowelsL :: Char -> Bool
remVowelsL c 
           | c =='a' = True
           | c =='e' = True
           | c =='i' = True
           | c =='o' = True
           | c =='u' = True
           | otherwise  = False
         

main :: IO ()
main = do
    print $  remVowels 'a'
    
