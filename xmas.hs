
main :: IO()
main = do 
    let s = [ x * (13-x)   |  x <- [12,11..1]]
--    print [ x * (13-x)   |  x <- [12,11..1]]
    print s 
    print $ sum s 
--    putStrLn s
--    print [x [x<- [12,11..1]]]
