-- usage is ...
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Reversew
import Middlew

main :: IO()
main = do
  line <- getLine
  if null line
    then return ()
    else do
--      putStrLn $ reverseWords line
    putStrLn $ middle line

  main
{-
reverseWords :: String -> String
reverseWords = unwords . map reverse . words
-}

