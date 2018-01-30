module Middle
  ( middle
  ) where
middle :: String -> String
middle = unwords . map middlep . words  
-- http://learnyouahaskell.com/higher-order-functions
-- http://www.cantab.net/users/antoni.diller/haskell/units/unit02.html
--check length of input string
--middle s = middle (reverse (init ( tail (word ))))
middlep :: String -> String
middlep    s 
    | (length s) < 3  = (reverse s)
    | length s < 2 = s
    | length s > 2 = last s :middlep (reverse (init ( tail s ))) ++ [head s]


