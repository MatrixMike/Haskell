{-# OPTIONS_GHC -fwarn-missing-signatures #-}

module Months
    (
    months,
    year,
    month,
    monInt,
    monthDate
    )
    where
    
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate
import Data.Char   

months :: [String]
months=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]

year :: Integer
year=2017

month :: Int
month=2

getDaysInMonth :: Integer -> Int -> (Int, Int)
getDaysInMonth year month=(nDays,sDay) 
                      where nDays = gregorianMonthLength year month
                            sDay= digitToInt(last(showWeekDate (fromGregorian year month 01)))
monInt :: Int
monInt = 10

monthDate :: (Int, Int)
monthDate = getDaysInMonth year month

--monthDate :: (Int, Int)
--monthDate = getDaysInMonth year month
