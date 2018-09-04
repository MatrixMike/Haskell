{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Months

--year = 2017
--getDaysInMonth :: Integer -> Integer -> Integer

--year :: Integer
--year=2017

month1 :: Int
month1=5
   
monInt :: Int
monInt = 9
   
main :: IO ()
main = do
    print $ months !!(3-1)
--    print $ Months.year
    print $ month1
    print $ month
    print $   Main.monInt  -- sources of monInt : local is Main.
    print $ Months.monInt  -- sources of monInt
    print "space"
    print $ Months.year -- ++ Months.month
    print $ Months.month
    print $ monthDate
    print $ year
    
    
    
    
