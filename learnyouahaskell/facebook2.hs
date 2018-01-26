{- see also outputB.hs
-}

main :: IO()
main = do
    print (head ["one", "two","three","four"])
    print (last ["one", "two","three","four"])
    print (tail ["one", "two","three","four"])
    print (init ["one", "two","three","four"])
    -- note output characters or string : elements or list
    let word = "one"
    print (head "one")
    print (last "one")
    print (tail "one")
    print (init "one")
    
    
