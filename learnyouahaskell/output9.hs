    import Control.Monad  
    import Data.Char  
{-
when testing this - reading data from terminal 
use ctrl-D as end-of-data and notice 'clean response'
-}
    main = forever $ do  
        putStr "Give me some input: "  
        l <- getLine  
        putStrLn $ map toUpper l  
