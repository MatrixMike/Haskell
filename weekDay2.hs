{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Char
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate
a :: [Int]
a =  [1..12]  -- list of months

day :: [[Char]]
day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

year :: Integer
year = 2019

month :: Int
month = 11   -- index max is 11 which shows that months might be 0 to 11

weekday :: [Char]
weekday =
  day !! digitToInt (last (showWeekDate (fromGregorian year month 01)))   --a(1)
  
weekday2 :: [Char]
weekday2 =
  day !! digitToInt (last (showWeekDate (fromGregorian year month 01)))   --a(1)
  
main :: IO ()
main = do
    print weekday
    print weekday2
    print $ fromGregorian year month 01
    print $ showWeekDate (fromGregorian year month 01)
    print $ last (showWeekDate (fromGregorian year month 01))
    print $ digitToInt (last (showWeekDate (fromGregorian year month 01)))
    print $ day !! digitToInt (last (showWeekDate (fromGregorian year 1 01)))
    print $ day !! digitToInt (last (showWeekDate (fromGregorian year 1 01)))
    print $ a
    print $ [x-1 | x<-a] 
--     print $      -- want to act on each in range
    print [x  | x <- [2, 5,7, 10]]
    print [x*2  | x <- [2, 5,7, 10]]
    print [x*2  | x <- a]
    print [day !! digitToInt (last (showWeekDate (fromGregorian year x 01)))  | x <- [1..7]]
