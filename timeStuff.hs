{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Time.Clock
import Data.Time.Calendar

main :: IO()
main = do
        now <- getCurrentTime
        let (year, month, day) = toGregorian $ utctDay now
        putStrLn $ "Year: " ++ show year
        putStrLn $ "Month: " ++ show month
        putStrLn $ "Day: " ++ show day
