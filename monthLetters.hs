{-# OPTIONS_GHC -fwarn-missing-signatures #-}
--https://stackoverflow.com/questions/27750952/generate-calendar-of-a-given-month-and-year-in-haskell

import Data.Time.Clock
import Data.Time.Calendar
import Data.Time.LocalTime
import Data.Time.Calendar.WeekDate
import Data.Char
year :: Integer
year=2019

month :: Int
month=12

months :: [[Char]]
months=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]

mnth :: [Char]
mnth=months!!(month-1)

main :: IO ()
main=do
       print $ year
       print $ month
       print $ mnth
       print $ concat [[r]++"\t|" | r <- mnth]
-- want to show max and min numbers of letters in month names
-- 7 days in week but December has 8 letters in it's word
--     print $ monthDate
--     print $ totalDays
--     putStrLn generateCalendar
