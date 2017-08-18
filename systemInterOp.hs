import System.Info

--import Happstack.Server.Env
import System.Environment

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
  getEnvironment >>= print
--    environment <- getEnvironment
--    simpleHTTP nullConf $ ok $ show environment
