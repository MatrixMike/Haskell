{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main :: IO()
main = do 
    let s = [ x * (13-x)   |  x <- [12,11..1]]
    let t = [ x * (13-x)   |  x <- [12,11..7]]

    print s
    print t
    print $ sum s 
    print $ 2 * sum t 
--    putStrLn s
--    print [x [x<- [12,11..1]]]
