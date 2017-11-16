-- http://www.happylearnhaskelltutorial.com/1/main_road.html#s4
-- a program to get and print
-- the current time as seconds

import Data.Time.Clock.POSIX

main :: IO ()
main = getPOSIXTime >>= print
