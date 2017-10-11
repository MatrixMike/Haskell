{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main :: IO ()
main = do
  print (map (++ "*") (map (++ "!") ["hey", "ho", "woo"]))
  print (map ((++ "*") . (++ "!") . (++ "^")) ["hey", "ho", "woo"])
