    import Control.Monad  
    import Data.Char  
{-
when testing this - reading data from terminal 
use ctrl-D as end-of-data and notice 'clean response'
16.08.2017 19:14:50
-}
    main = forever $ do  
        putStr "Give me some input: "  
        l <- getLine  
        putStrLn $ map toUpper l  
