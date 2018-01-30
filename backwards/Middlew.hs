module Middlew
  ( middle
  ) where
middle :: [Char] -> [Char]
middle = unwords . map middlep . words  

-- http://learnyouahaskell.com/higher-order-functions
-- http://www.cantab.net/users/antoni.diller/haskell/units/unit02.html
--check length of input string
--middle s = middle (reverse (init ( tail (word ))))
middlep :: [Char] -> [Char]
middlep    s 
    | (length s) < 3  = (reverse s)
    | length s < 2 = s
    | length s > 2 = last s :middlep (reverse (init ( tail s ))) ++ [head s]


