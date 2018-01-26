{- see also outputB.hs
-}

main :: IO()
main = do
{-    print (head ["one", "two","three","four"])
    print (last ["one", "two","three","four"])
    print (tail ["one", "two","three","four"])
    print (init ["one", "two","three","four"])
-}
  -- note output characters or string : elements or list
    let word = "Linux"    -- try with own choice of word
    
    print (head word)
    print (tail word)
    
    print (init word)
    print (last word)

    print (init (tail (word)))
      
-- works for lists with 2 or more elements
-- easy fix for lists with 1 element (but do later)
   
