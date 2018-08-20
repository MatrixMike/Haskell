{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Time.Clock
import Data.Time.Calendar
import Data.Time.LocalTime
import Data.Time.Calendar.WeekDate

{-
https://techoverflow.net/2014/06/13/get-current-year-month-day-in-haskell/
-}

{-thisYear :: Day -> Integer
thisYear  = toGregorian $ localDay zoneNow
-}

 

main :: IO()
main = do
    now <- getCurrentTime
    timezone <- getCurrentTimeZone
    let zoneNow  = utcToLocalTime timezone now
    let zoneNow2 = utcToZonedTime timezone now
    let (year, month, day) = toGregorian $ localDay zoneNow
    let swd = showWeekDate  --takes Day
--    let (year2, month2, day2) = toGregorian $ localDay zoneNow2
--    showWeekDate :: Day 
    
    putStrLn $ "Year: " ++ show year
    putStrLn $ "Month: " ++ show month
    putStrLn $ "Day: " ++ show day
--    putStrLn $  swd
--    putStrLn   zoneNow
--    putStrLn $ "tz" ++ timezone   
--    putStrLn $ "WeekDate" ++ show swd
--    putStrLn $ now

    
   
