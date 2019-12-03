{-# OPTIONS_GHC -fwarn-missing-signatures #-}
--https://stackoverflow.com/questions/27750952/generate-calendar-of-a-given-month-and-year-in-haskell

import Data.Time.Clock
import Data.Time.Calendar
import Data.Time.LocalTime
import Data.Time.Calendar.WeekDate
import Data.Char

getDaysInMonth year month=(nDays,sDay) 
                          where nDays = gregorianMonthLength year month
                                sDay= digitToInt(last(showWeekDate (fromGregorian year month 01)))
year :: Integer
year=2019

month :: Int
month=12

months=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]
mnth=months!!(month-1)
monthDate = getDaysInMonth year month
startAt=snd(monthDate)
totalDays = fst(monthDate)
printLine = "\n"++concat ["+---\t" | r <- [1..7]]
check x | x>totalDays=""
        | x<=totalDays=show x
genDays n m="\n "++concat[check(x)++"\t|"|x<-[n..m]]
genD 6=""
genD sP=genDays ((sP-1)*7+1) (sP*7) ++genD (sP+1)
generateCalendar=printLine++"\n "++
                        concat [[r]++"\t|" | r <- mnth]++printLine++
                        "\n Sun\t|Mon\t|Tue\t|Wed\t|Thu\t|Fri\t|Sat"++printLine++
                        genD 1
main :: IO ()
main=do
     print $ monthDate
     print $ totalDays
     putStrLn generateCalendar
