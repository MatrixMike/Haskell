
main :: IO()

main = do 
    print [ x * (13-x)   |  x <- [12,11..1]]
--    print [x [x<- [12,11..1]]]
