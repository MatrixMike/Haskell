{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Time.Clock
import Data.Time.Calendar
import Data.Time.LocalTime
import Data.Time.Calendar.WeekDate

{-
https://techoverflow.net/2014/06/13/get-current-year-month-day-in-haskell/
-}

main :: IO()
main = do
    now <- getCurrentTime
    timezone <- getCurrentTimeZone
    let zoneNow = utcToLocalTime timezone now
    let (year, month, day) = toGregorian $ localDay zoneNow
    let swd = showWeekDate
    
    putStrLn $ "Year: " ++ show year
    putStrLn $ "Month: " ++ show month
    putStrLn $ "Day: " ++ show day
--    putStrLn $ "Day: " ++ show day
--   putStrLn $ now
    
--    putStrLn $ "WeekDate" ++ show swd
    
