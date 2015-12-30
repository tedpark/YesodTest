module Paths_testYesod (
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

bindir     = "/Users/ted/ProjectLocal/YesodTest/testYesod/.stack-work/install/x86_64-osx/nightly-2015-12-19/7.10.3/bin"
libdir     = "/Users/ted/ProjectLocal/YesodTest/testYesod/.stack-work/install/x86_64-osx/nightly-2015-12-19/7.10.3/lib/x86_64-osx-ghc-7.10.3/testYesod-0.1.0.0-EdHUwbpZeonDKLDU4zvyxu"
datadir    = "/Users/ted/ProjectLocal/YesodTest/testYesod/.stack-work/install/x86_64-osx/nightly-2015-12-19/7.10.3/share/x86_64-osx-ghc-7.10.3/testYesod-0.1.0.0"
libexecdir = "/Users/ted/ProjectLocal/YesodTest/testYesod/.stack-work/install/x86_64-osx/nightly-2015-12-19/7.10.3/libexec"
sysconfdir = "/Users/ted/ProjectLocal/YesodTest/testYesod/.stack-work/install/x86_64-osx/nightly-2015-12-19/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "testYesod_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "testYesod_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "testYesod_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "testYesod_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "testYesod_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
