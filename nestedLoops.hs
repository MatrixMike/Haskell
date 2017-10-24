{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# OPTIONS_GHC -fprint-potential-instances #-}

{- fx :: Float
fx = 1.1
https://en.wikibooks.org/wiki/Haskell/Building_vocabulary
fy :: Float
fy = 1.1
-}



main :: IO ()
main = do
--  let fx = fromIntegral a 
    print [x * 10 + y | x <- [1 .. 3], y <- [4 .. 6]]
    print 5
--    print [fx / fy | fx <- [22.0 32.0 42.0], fy <- [26 23 21 19 17 15 13 12]]
    print [fx  / fy   | fx <- [22.0 32.0 42.0], fy <- [26.0 23.0]]
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
