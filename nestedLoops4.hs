
--- import Control.Applicative
{-
https://stackoverflow.com/questions/35198897/does-mean-assigning-a-variable-in-haskell
http://learnyouahaskell.com/syntax-in-functions
-}

main = do
   let xs = [(1,3),(4,3)]
--   let [a+b |  (a,b) <- xs ]
   print   [a+b |  (a,b) <- xs ]
   --  [c| c <- x]
--   c <- xs
   --return c
   -- print $ c
   
       -- liftM2 (\a b -> a * 10 + b) [1..3] [4..6]
