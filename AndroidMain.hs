{-# LANGUAGE ForeignFunctionInterface, CPP #-}
{-# OPTIONS_GHC -Wall #-}

--
-- This module is used in the Android and iOS build
--
module AndroidMain where

import Foreign.C.String

-- friends
import Game (game)

foreign export ccall Just "haskell_main" main :: CString -> IO ()

main :: CString -> IO ()
main _ = game True
