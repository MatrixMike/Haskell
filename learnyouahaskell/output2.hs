{-# OPTIONS_GHC -fwarn-missing-signatures #-}

main :: IO()
main = do
  return ()
  return "HAHAHA"
  line <- getLine
  return "BLAH BLAH BLAH"
  return 4
  putStrLn line
