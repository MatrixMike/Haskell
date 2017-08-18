-- 18.08.2017 05:27:56
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-https://stackoverflow.com/questions/27507393/using-bitwise-and-operation-in-haskell-}
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
  

