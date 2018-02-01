module Middlew
  ( middle
  ) where
middle :: String -> String
middle = unwords . map middle1 . words  
{-
for . see function composition 
--http://learnyouahaskell.com/higher-order-functions
-}

middle1 :: String -> String
middle1 s   =  reverse (middlep s)  --add reverse somehow -- "abcdef" --


-- http://learnyouahaskell.com/higher-order-functions
-- http://www.cantab.net/users/antoni.diller/haskell/units/unit02.html
--check length of input string
--middle s = middle (reverse (init ( tail (word ))))
middlep :: String -> String
middlep    s 
    | length s < 3  = reverse s
    | length s < 2 = s
    | length s > 2 = last s :middlep (reverse (init ( tail s ))) ++ [head s]
--    | length s > 2 = last s:middlep (reverse (init . tail) s ) ++ [head s]

--negabs 
--negabs =  (negate . abs) [5,-3,-6,7,-3,2,-19,24] 
