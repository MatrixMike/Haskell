{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main :: IO()
main = do
  a <- return "hell"
  b <- return "yeah!"
  putStrLn $ a ++ " " ++ b
