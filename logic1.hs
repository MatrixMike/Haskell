-- 18.08.2017 05:27:56
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Bits
x :: Bool
x = True

y :: Bool
y = False

t :: Int    {- without this get some interesting & helpful results from ghc-}
t = (.&.) 6 5


main :: IO ()
main = do
  print x
  print y
  print (x && y)
  print (x || y)
  print (not (x || y))
  print  t
  

