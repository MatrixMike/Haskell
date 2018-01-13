import Control.Monad
import Data.Char
{-# OPTIONS_GHC -fwarn-missing-signatures #-}    
main = forever $ do
    putStr "Give me some input: "
    l <- getLine
--    let l = "sadasd"
    putStrLn $ map toLower l

-- MSR213U Card Reader
-- changed to demo reading from Credit Card type magnetic stripe reader
-- 13.01.2018 15:58:21
