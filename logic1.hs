-- 18.08.2017 05:27:56
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
x = True

y = False

main = do
  print x
  print y
  print (x && y)
  print (x || y)
