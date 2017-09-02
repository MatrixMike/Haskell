{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc
    ) where

import GHCJS.Foreign ()
import GHCJS.Types

foreign import javascript unsafe "window.alert($1)" js_alert :: JSString -> IO ()

someFunc :: IO ()
someFunc = js_alert "Hello from GHCJS!"