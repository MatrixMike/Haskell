module Paths_Sin (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mikeh/.cabal/bin"
libdir     = "/home/mikeh/.cabal/lib/x86_64-linux-ghc-8.0.2/Sin-0.1.0.0-IojohodFICNIZRY4a1Ndh7"
datadir    = "/home/mikeh/.cabal/share/x86_64-linux-ghc-8.0.2/Sin-0.1.0.0"
libexecdir = "/home/mikeh/.cabal/libexec"
sysconfdir = "/home/mikeh/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Sin_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Sin_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Sin_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Sin_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Sin_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
