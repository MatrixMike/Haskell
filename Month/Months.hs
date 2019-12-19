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
year=2019

month :: Int
month=12

getDaysInMonth :: Integer -> Int -> (Int, Int)
getDaysInMonth year month=(nDays,sDay) 
                      where nDays = gregorianMonthLength year month
                            sDay= digitToInt(last(showWeekDate (fromGregorian year month 01)))
monInt :: Int
monInt = 10

monthDate :: (Int, Int)
monthDate = getDaysInMonth Months.year Months.month

--monthDate :: (Int, Int)
--monthDate = getDaysInMonth year month
