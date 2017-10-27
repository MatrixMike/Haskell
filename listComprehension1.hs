import Data.Char (toUpper)

{-
https://wiki.haskell.org/List_comprehension
-}
remVowels :: Char -> Char
remVowels c 
           | c =='a' = 'x'
           | c =='e' = 'x'
           | c =='i' = 'x'
           | c =='o' = 'x'
           | c =='u' = 'x'  
           | otherwise  = 'z'
           
s :: String
s = "Hello"

main :: IO ()
main = do
--  let a = [toUpper c | c <- "some text"]
   let s1 = ['a'..'w']
   let a = [toUpper c | c <- [' '..'~']]
   print a
   let b = [remVowels c | c <- ['a'..'z']]
   print b

{-
"HELLO"
-}
