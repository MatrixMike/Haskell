
--- import Control.Applicative
{-
https://stackoverflow.com/questions/35198897/does-mean-assigning-a-variable-in-haskell
-}

main = do
   let x = 6   
   let c = 1
   print x
   --  [c| c <- x]
   c <- x
   --return c
   -- print $ c
   
       -- liftM2 (\a b -> a * 10 + b) [1..3] [4..6]
