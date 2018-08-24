{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate
import Data.Char
import Months

--year = 2017
--getDaysInMonth :: Integer -> Integer -> Integer
year = 2017

month1 = 6
   
monthDate = getDaysInMonth Months.year Months.month

main :: IO ()
main = do
    print $ months !!(3-1)
    print $ Months.year
    print $ month1
    print $ monthDate
    
    
    
