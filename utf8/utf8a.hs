#!/usr/bin/env stack
-- stack --resolver lts-6.19 --install-ghc runghc --package text
{-# LANGUAGE OverloadedStrings #-}
-- https://haskell-lang.org/tutorial/string-types
import qualified Data.ByteString as S
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
--The basic premise is: file formats should typically be explicit in their character encoding.
main :: IO ()
main = do
    let text = "This is some text, with non-Latin chars: שלום"
        bs = TE.encodeUtf8 text
    S.writeFile "content.txt" bs
    bs2 <- S.readFile "content.txt"
    let text2 = TE.decodeUtf8 bs2
    print text2
