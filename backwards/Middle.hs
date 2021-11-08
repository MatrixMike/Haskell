module Middle
  ( middle
  ) where
  
-- http://learnyouahaskell.com/higher-order-functions
-- http://www.cantab.net/users/antoni.diller/haskell/units/unit02.html
--check length of input string
--middle s = middle (reverse (init ( tail (word ))))
middle :: String -> String
middle    s 
    | (length s) < 3  = (reverse s)
    | length s < 2 = s
    | length s > 2 = last s :middle (reverse (init ( tail s ))) ++ [head s]
