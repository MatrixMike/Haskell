import Data.Time
import Data.Time.Format

--months 

main :: IO ()
main = print $ weekday d

a =  [1..12]  -- list of months
--d = fromGregorian 2017 03 08
--d = fromGregorian 2019 01 12
--d = fromGregorian 2019 12 01
--weekday = formatTime defaultTimeLocale "%a"
d = fromGregorian 2019 11 01

weekday = formatTime defaultTimeLocale "%a"