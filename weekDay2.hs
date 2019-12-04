import Data.Char
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

year = 2017

month = 5

weekday =
  day !! digitToInt (last (showWeekDate (fromGregorian year month 01)))

main :: IO ()
main = print weekday
