-- usage is ...
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Reversew

main :: IO()
main = do
  line <- getLine
  if null line
    then return ()
    else do
      putStrLn $ reverseWords line
      main
{-
reverseWords :: String -> String
reverseWords = unwords . map reverse . words
-}
<<<<<<< HEAD

=======
>>>>>>> dc23748f0ce48dc44d6b1968b886dac22cae6f60
