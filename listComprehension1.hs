import Data.Char (toUpper)

{-
https://wiki.haskell.org/List_comprehension
-}
remVowels :: Char -> Char
remVowels c
  | c == 'a' = c
  | c == 'e' = c
  | c == 'i' = c
  | c == 'o' = c
  | c == 'u' = c
  | otherwise = 'z'
  where  x = 'x'

s :: String
s = "Hello"

b = {-map toUpper-} [remVowels c | c <- ['a' .. 'z']]
--print b


main :: IO ()
main
--  let a = [toUpper c | c <- "some text"]
 = do
  let s1 = ['a' .. 'w']
  let a = [{-toUpper-} c | c <- [' ' .. '~']]
  print a
  print b

{-
"HELLO"
-}
