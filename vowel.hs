-- 08.10.2017 17:30:47
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
           | c =='e' = 'y'
--         | c ='i'
--         | c ='o'
--         | c ='u'  
           | otherwise  = 'z'
         
    

main :: IO ()
main = do
    print $  remVowels 'a'
    
