{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import System.Info
-- 01.10.2017 22:38:53
--import Happstack.Server.Env
import System.Environment

main :: IO ()
main = do
  print os
  print arch
  print compilerName
  print compilerVersion
{-    getCurrentDirectory >>= print 
    getHomeDirectory >>= print
    getUserDocumentsDirectory >>= print  -}
  getArgs >>= print
  getProgName >>= print
--  getEnvironment >>= print        --works well, just a lot of output to deal with
--    environment <- getEnvironment
--    simpleHTTP nullConf $ ok $ show environment
