{-# OPTIONS_GHC -fwarn-missing-signatures #-}

-- (/) :: Fractional a => a -> a -> a
{-
https://stackoverflow.com/questions/3968265/integer-to-float
-}
main :: IO ()
main = do
  let a = 3
  let b = 2
  let newy = fromIntegral a / fromIntegral b
  print $ posToXY 3.0 1.2
  print $ posToXYf 3.0 1.2
  print $ myFloat

myFloat :: Float    -- with or w/o parens around Float
myFloat = 1.1
-- main = print 3.0 / 2.0 :: Fractional a => a -> a -> a
posToXY :: Float -> Float -> Integer
posToXY a b = do
  let y = a / b
  round y

posToXYf :: Float -> Float -> Float
posToXYf a b = do
  let y = a / b
  y


