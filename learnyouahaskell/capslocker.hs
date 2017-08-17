    import Control.Monad
    import Data.Char
    
    main =
      forever $ do
        putStr "Give me some input: "
        l <- getLine
        let l = "sadasd"
        putStrLn $ map toUpper l
