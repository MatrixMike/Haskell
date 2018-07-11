#!/usr/bin/env stack
-- stack --resolver lts-6.19 --install-ghc runghc --package text --package streaming-commons
{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Read as TR

alice :: Text
alice = T.unlines
    [ "Name: Alice"
    , "Age: 30"
    , "Score: 5"
    ]

bob :: Text
bob = T.unlines
    [ "Name: Bob"
    , "Age: 25"
    , "Score: -3"
    ]

invalid :: Text
invalid = "blah blah blah"

parsePerson :: Text -> Maybe (Text, Int, Int)
parsePerson t0 = do
    t1 <- T.stripPrefix "Name: " t0
    let (name, t2) = T.break (== '\n') t1
    t3 <- T.stripPrefix "\nAge: " t2
    Right (age, t4) <- Just $ TR.decimal t3
    t5 <- T.stripPrefix "\nScore: " t4
    Right (score, "\n") <- Just $ TR.signed TR.decimal t5
    return (name, age, score)

main :: IO ()
main = do
    print (parsePerson alice)
    print (parsePerson bob)
    print (parsePerson invalid)
