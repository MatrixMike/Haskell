{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import System.Directory

main :: IO ()
main = do
    getCurrentDirectory >>= print 
    getHomeDirectory >>= print
    getUserDocumentsDirectory >>= print
