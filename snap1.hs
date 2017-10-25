{-# LANGUAGE OverloadedStrings #-}

import Snap.Http.Server
import Snap.Core

main = httpServe defaultConfig $ writeBS "Hello, world!"
