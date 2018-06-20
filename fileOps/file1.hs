{-# START_FILE main.hs #-}
main = readFile "file.txt" >>= putStr

{-# START_FILE file.txt #-}
{- Hello, world! -}
