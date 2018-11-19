{-# OPTIONS_GHC -fwarn-missing-signatures #-}

--catenary :: 
--       catenary :: forall a. Floating a => a -> a -> a
-- learn the meaning of forall a. 
catenary :: Floating a => a -> a -> a
catenary a x = a * cosh (x / a)

main :: IO ()
main = do
  let a = 0.1
  print [cosh x | x <- [0.1,0.2 .. 2.0]]
  putStrLn "xxx"
  print [catenary a x | x <- [-0.7,-0.65 .. 0.7]]
  print $ exp 1     -- added just to test expression to get 2.718...  Naperian Logs 
  print $ (1 - 1/(exp 1))
