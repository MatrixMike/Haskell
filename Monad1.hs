import System (getArgs)
main :: IO ()
main = do 
   args <- getArgs
   case args of
     [fname] -> do fstr <- readFile fname
                   let nWords = length . words $ fstr
                       nLines = length . lines $ fstr
                       nChars = length fstr
                   putStrLn . unwords $ [ show nLines
                        , show nWords
                        , show nChars
                        , fname]
     _ -> putStrLn "usage: wc fname"
    
  
