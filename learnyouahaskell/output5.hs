main = do 
    print (map (++ "*") (map (++ "!") ["hey", "ho", "woo"]))
    print (  map ((++ "*") . (++ "!"). (++ "^")) ["hey", "ho", "woo"])
