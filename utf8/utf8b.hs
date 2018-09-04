#!/usr/bin/env stack
-- stack --resolver lts-6.19 --install-ghc runghc --package text
import Data.ByteString (ByteString)
import qualified Data.ByteString as S
import qualified Data.ByteString.Char8 as S8
import Data.Text (Text)
import qualified Data.Text as T
--The basic premise is: file formats should typically be explicit in their character encoding.
main :: IO ()
main = do
    print (S8.pack "ByteString: Non Latin characters: שלום" :: ByteString)
    print (T.pack  "Text:       Non Latin characters: שלום" :: Text)
