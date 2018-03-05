{-# OPTIONS_GHC -fwarn-missing-signatures #-}


import qualified Foreign.C.String as String

newCString :: String
newCString = "Testé"

main :: IO ()
main = do
  putStrLn "start"
  putStrLn newCString


--05.03.2018 19:50:09
-- this makes a form of sense now:
-- line 12 ref to newCString
-- newCString typed on line 6
-- and imported on line 4
