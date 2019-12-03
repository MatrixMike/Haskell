{-# OPTIONS_GHC -fwarn-missing-signatures #-}

import Data.Char
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

-- this fails for December 2019 - wrong day for start
{-do
   now <- getCurrentTime
   timezone <- getCurrentTimeZone
   
let zoneNow  = utcToLocalTime timezone now
--let zoneNow2 = utcToZonedTime timezone now
let (year, month, day) = toGregorian $ localDay zoneNow
-}
--   now = getCurrentTime
year :: Integer
year = 2019

month :: Int
month = 12

months :: [String]
months =
  [ "JANUARY"
  , "FEBRUARY"
  , "MARCH"
  , "APRIL"
  , "MAY"
  , "JUNE"
  , "JULY"
  , "AUGUST"
  , "SEPTEMBER"
  , "OCTOBER"
  , "NOVEMBER"
  , "DECEMBER"
  ]

mnth :: [Char]
mnth = months !! (month - 1)

monthDate :: (Int, Int)
monthDate = getDaysInMonth year month

startAt :: Int
startAt = snd (monthDate)

totalDays :: Int
totalDays = fst (monthDate)

getDaysInMonth year month = (nDays, sDay)
  where
    nDays = gregorianMonthLength year month
    sDay = digitToInt (last (showWeekDate (fromGregorian year month 01)))

cells = (replicate n1 "") ++ [show d | d <- [1 .. lastday]] ++ (replicate n2 "")
  where
    lastday = totalDays
    n1 = (startAt - 1)
    n2 = (7 - (totalDays - (29 - startAt)))

chunksOf7 [] = []
chunksOf7 (a:b:c:d:e:f:g:rest) = [[a, b, c, d, e, f, g]] ++ chunksOf7 rest

pad n str = str ++ (replicate (n - (length str)) ' ')

renderCell c = pad 3 c ++ "|"

renderChunk cells = (concat $ map renderCell cells) ++ "\n"

printLine = "\n" ++ concat ["+---" | r <- [1 .. 7]] ++ "\n"

monthLine = concat [[r] ++ " |" | r <- mnth]

dayLine = "Sun|Mon|Tue|Wed|Thu|Fri|Sat"

heading =
  concat
    [ printLine
    , "Year: "
    , show year
    , printLine
    , monthLine
    , printLine
    , dayLine
    , printLine
    ]

renderCalendarBody cells = heading ++ concat (map renderChunk chunks)
  where
    chunks = chunksOf7 cells

main = do
  putStrLn $ renderCalendarBody cells
