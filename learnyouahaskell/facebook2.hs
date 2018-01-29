{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{- see also outputB.hs
-}
word = "another"
h2 = (head word)


middle :: String -> String
--check length of input string
middle s = middle (reverse (init ( tail (word ))))
-- 


main :: IO ()
main
{-    print (head ["one", "two","three","four"])
    print (last ["one", "two","three","four"])
    print (tail ["one", "two","three","four"])
    print (init ["one", "two","three","four"])
-}
  -- note output characters or string : elements or list
 = do
--    let word = "Linux" -- try with own choice of word
    let h = (head word)
    let t = (tail word)
    let i = (init word)
    let l = (last word)
    let it = init (tail word)
    let new = l : it ++ [h]
    print (head word) -- an element
    print (tail word) -- a list 

    print (init word) -- a list
    print (last word) -- an element

    print $ init (tail word) -- was (   ())
    print new
--    print $ middle "algebra"
    print (reverse (init ( tail (word ))))
{- works for lists with 2 or more elements
 easy fix for lists with 1 element (but do later)
   print  $  (last word) ++ (init (tail (word))) --    ++ head word
 the above causes compiler errors : consider that the answerw to the partial results 
 could be elements OR lists
-}
