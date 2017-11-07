{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import qualified Data.ByteString.Lazy as L
import Network.HTTP.Conduit

{-
cabal install http-conduit
https://haskell-lang.org/library/http-client
-}
main :: IO()
main = simpleHttp "http://www.celestrak.com/NORAD/elements/cubesat.txt" >>= L.putStr
