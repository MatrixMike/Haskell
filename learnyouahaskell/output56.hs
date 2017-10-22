{-# OPTIONS_GHC -fwarn-missing-signatures #-}

main :: IO ()
main = do
  c <- getChar
  if c /= ' '
    then do
      putChar c
      main
    else return ()
