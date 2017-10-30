{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import qualified Data.ByteString.Lazy as L
import Network.HTTP.Conduit

{-
cabal install http-conduit
https://haskell-lang.org/library/http-client
-}
main :: IO()
main = simpleHttp "https://www.haskell.org" >>= L.putStr
