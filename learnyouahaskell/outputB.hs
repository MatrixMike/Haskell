main = do
--  print (map (++ "*") (map (++ "!") ["hey", "ho", "woo"]))
    print  ["one", "two","three","four"]
    print (head ["one", "two","three","four"])
    print (last ["one", "two","three","four"])
    print (tail ["one", "two","three","four"])
    print (init ["one", "two","three","four"])
    print (length ["one", "two","three","four"])
    print (null ["one", "two","three","four"])
--    print (uncons ["one", "two","three","four"])
    print ( ["one", "two","three","four"] ++ ["x","y"])
    print ( ["one", "two","three","four"] ++ ["y"])   
    let y = "why" 
    print ( ["one", "two","three","four"] ++ [y])    
