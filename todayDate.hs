import Data.Time.Clock
import Data.Time.Calendar

date :: IO (Integer,Int,Int) -- :: (year,month,day)
date = getCurrentTime >>= return . toGregorian . utctDay
{-
-}
main :: IO ()
main = do
    print  date
    

