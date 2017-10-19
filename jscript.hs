{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{-
16.10.2017 20:42:58   no idea where to go from this
-}
import Text.Jasmine
import Data.ByteString.Lazy.Char8

main = print $ unpack $ minify "function test() { alert('Hello, world!'); }"
