{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Char
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

a :: [Integer]
a =  [1..12]  -- list of months

main :: IO ()
main = do
    print $ a
--     print $      -- want to act on each in range
    print [x  | x <- [2, 5,7, 10]]
    print [x*2  | x <- [2, 5,7, 10]]
    print [x*2  | x <- a]

