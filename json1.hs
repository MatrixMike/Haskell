{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-
cabal install : ~/cabal/cabal install aeson
note tabs warning a.o.t. spaces : System/Random.hs:43:1: warning: [-Wtabs]
-}

import Data.Aeson
import Data.ByteString.Lazy.Char8
import GHC.Generics
{-
http://json.org/
-}

data MyData = MyData { text :: String, number :: Int } deriving (Show, Generic)

instance FromJSON MyData
instance ToJSON MyData

myData :: MyData
myData = MyData "Hello" 123

main :: IO()
main = do
    print myData
    print $ unpack $ encode myData
    print "----"
    print $ (decode "{ \"number\" : 123, \"text\" : \"Hello\" }" :: Maybe MyData)
    print "----"
    print $ (decode "{ \"number\" : 123, \"text\" : \"HelloM\" }" :: Maybe MyData)
