{-# OPTIONS_GHC -fwarn-missing-signatures #-}

main :: IO ()
main = print [x * 10 + y | x <- [1 .. 3], y <- [4 .. 6]]
{-
https://stackoverflow.com/questions/16904427/nested-loop-equivalent
-}
--  a <- [1, 2, 3]
--  b <- [4, 5, 6]
--  return $ a * 10 + b
{-	
main = print do
  a <- [1, 2, 3]
  b <- [4, 5, 6]
  return $ a * 10 + b
-}
