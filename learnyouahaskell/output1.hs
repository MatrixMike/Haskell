main = do
  putStrLn "Hello, what's your name?"
  -- The var <- action assigns a value that is produced by an action 
  name <- getLine
  putStrLn ("Hey " ++ name ++ ", you rock!")
