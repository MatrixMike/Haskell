{-# OPTIONS_GHC -fwarn-missing-signatures #-}

-- 04.03.2018 13:05:00
catenary :: Floating a => a -> a -> a
catenary a x = a * cosh (x / a)

main :: IO ()
main = do
  let a = 0.1
  print [cosh x | x <- [0.1,0.2 .. 2.0]]
  putStrLn "xxx"
  print [catenary a x | x <- [-0.7,-0.6 .. 0.7]]
