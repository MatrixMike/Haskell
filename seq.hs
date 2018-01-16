{-
aim would be to display a range of numbers between gcd inputs in steps of gcd
http://radio.abc.net.au/help/offline
    HorshamABC Radio594 AM (3WV)
    MelbourneABC Classic FM105.9 FM (3ABCFM)
    MelbourneABC Digital Radio206.352 MHz (DAB9C)
    MelbourneABC NEWS on radio1026 AM (3PB)
    MelbourneABC Radio774 AM (3LO)
    MelbourneABC RN621 AM (3RN)
    MelbourneABC triple j107.5 FM (3JJJ)
-}

v1 = 621
v2 = 774
lst1 = [2,5..40]
p1 = min v1 v2
p2 = gcd  v1 v2
p3 = max v1 v2
amr = [p1,p2..p3]
--amradio = [(min v1 v2), p2 ..       (max v1 v2)]

main :: IO()
main = do
    print p1 
    print p2 
    print p3
--    let p2 = gcd  v1 v2
    print p2
    print  $ gcd (min v1 v2) (max v1 v2)
    print  $ gcd 594 774
    print  $ gcd 594 621
    let amradio = [p1, p2 ..       p3]
--    print amradio
    print "amr"
    print amr
    print lst1
    print $ take 50 $ iterate (+9) 594

    
    
    
    
    
