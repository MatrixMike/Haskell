{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import qualified Data.ByteString.Lazy as L
import Network.HTTP.Conduit

{-
cabal install http-conduit
https://haskell-lang.org/library/http-client

see also https://en.wikipedia.org/wiki/Two-line_element_set


want line 2 : 53 to 63 (revolutions per day)

-}
main :: IO()
--main = simpleHttp "http://www.celestrak.com/NORAD/elements/cubesat.txt" >>= L.putStr
main = simpleHttp "https://www.celestrak.com/NORAD/elements/amateur.txt" >>= L.putStr

-- now search for 43017 at start of lines (2) and display 
-- then calculate height etc 

