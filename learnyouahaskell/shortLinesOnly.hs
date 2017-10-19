{-# OPTIONS_GHC -fwarn-missing-signatures #-}

main :: IO()
main = interact shortLinesOnly
{-
another fun one to play with 
seems like : input is processed and displayed as long as line length is < 10
-}
--  let lineLength = 10

shortLinesOnly :: String -> String
shortLinesOnly input =
  let allLines = lines input
      shortLines = filter (\line -> length line < 10) allLines
      result = unlines shortLines
  in result
