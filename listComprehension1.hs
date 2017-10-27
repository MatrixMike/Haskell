import Data.Char (toUpper)

{-
https://wiki.haskell.org/List_comprehension
-}
s :: String
s = "Hello"

main :: IO ()
main = do
--  let a = [toUpper c | c <- "some text"]
   let s1 = ['a'..'w']
   let a = [toUpper c | c <- ['a'..'w']]
   print a


{-
"HELLO"
-}
