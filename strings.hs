{-# OPTIONS_GHC -fwarn-missing-signatures #-}

import Data.Char
import Data.List

{-
https://lotz84.github.io/haskellbyexample/ex/string-functions
-}
include :: String -> String -> Bool
include xs ys = or . map (isPrefixOf ys) . tails $ xs

joinWith :: [String] -> String -> String
joinWith xs sep = concat . init . concat $ [[x, sep] | x <- xs]

split :: String -> Char -> [String]
split "" _ = []
split xs c =
  let (ys, zs) = break (== c) xs
  in if null zs
       then [ys]
       else ys : split (tail zs) c

main :: IO ()
main = do
  putStrLn $ "Contains:  " ++ show ("test" `include` "es")
  putStrLn $ "Count:     " ++ show (length . filter (== 't') $ "test")
  putStrLn $ "HasPrefix: " ++ show (isPrefixOf "te" "test")
  putStrLn $ "HasSuffix: " ++ show (isSuffixOf "st" "test")
  putStrLn $ "Index:     " ++ show (elemIndex 'e' "test")
  putStrLn $ "Join:      " ++ show (["a", "b"] `joinWith` "-")
  putStrLn $ "Repeat:    " ++ show (replicate 5 'a')
  putStrLn $
    "Replace:   " ++
    show
      (map
         (\x ->
            if x == 'o'
              then '0'
              else x)
         "foo")
  putStrLn $ "Split:     " ++ show (split "a-b-c-d-e" '-')
  putStrLn $ "ToLower:   " ++ map toLower "TEST"
  putStrLn $ "ToUpper:   " ++ map toUpper "test"
  putStrLn ""
  putStrLn $ "Len: " ++ show (length "hello")
  putStrLn $ "Char:" ++ show ("hello" !! 1)
