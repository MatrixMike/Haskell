{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

{-
cabal install formatting  : a bit of a guess but it worked : formatting-6.2.5
-}
import Data.Char (chr)
import Formatting
import System.IO

data Point = Point
  { x :: Int
  , y :: Int
  } deriving (Show)

bg :: [Double]
bg = (/)  <$> [22.0, 32.0, 42.0] <*> [26, 23, 21, 19, 17, 15, 13, 12]  -- produces an unsorted list

main :: IO()
main = do
  let p = Point 1 2
  fprint ("|" % (prec 5) % "|" % (prec 5) % "|\n")  (3.45 :: Double) (7.89 :: Double)
  fprint ("|" % (prec 5) %  "|\n")  (6.78 :: Double)
  fprint (shown % "\n") p
  fprint (shown % "\n") True
  fprint (int % "\n") 123
  fprint (bin % "\n") 14
  fprint (char % "\n") $ chr 33
  fprint (hex % "\n") 456
  fprint (hex % "\n") 100
  fprint (float % "\n") 78.9
  fprint ((expt 4) % "\n") 123400000.0
  fprint (text % "\n") "string"
  fprint (shown % "\n") "string"
  fprint
    ("|" % (left 6 ' ') % "|" % (left 6 ' ') % "|\n")
    (12 :: Int)
    (345 :: Int)
  fprint
    ("|" % (prec 5) % "|" % (prec 5) % "|\n")
    (1.2 :: Double)
    (3.45 :: Double)
  fprint
    ("|" % (left 6 ' ') % "|" % (left 6 ' ') % "|\n")
    ("foo" :: String)
    ("b" :: String)
  fprint
    ("|" % (right 6 ' ') % "|" % (right 6 ' ') % "|\n")
    ("foo" :: String)
    ("b" :: String)
  let s = format ("a " %string) "string"
  print s
  hPrint stderr $ format ("an " %string) "error"
  mapM_ print bg
  fprint ("|" % (prec 6) %  "|\n")  (56.7812345 :: Double)

  

{-
Point {x = 1, y = 2}
True
123
1110
!
1c8
64
78.9
1.2340e8
string
"string"
|    12|   345|
|1.2000|3.4500|
|   foo|     b|
|foo   |b     |
"a string"
"an error"

-}
