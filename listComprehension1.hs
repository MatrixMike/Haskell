{-# OPTIONS_GHC -fwarn-missing-signatures #-}

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
  where
    x = 'x'

s :: String
s = "Hello"

b :: [Char]
b = [remVowels c | c <- ['a' .. 'z']] {-map toUpper-}

--print b
main :: IO ()
main
--  let a = [toUpper c | c <- "some text"]
 = do
  let s1 = ['a' .. 'w']
  let a = [c | c <- [' ' .. '~']] {-toUpper-}
  print a
  print b
  print [x  | x <- [2, 5,7, 10]]
  print [x * y | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50]
  --http://learnyouahaskell.com/starting-out#im-a-list-comprehension
  print "zzz"
  print [x * y * z | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50, z <- [2]]
{-
"HELLO"
-}
