import Control.Applicative ((<$>))
-- look for 364 in the output - days of Christmas
-- 16.12.2017 12:00:51
center :: String -> Int -> String
center s n = spaces ++ s ++ spaces
  where spaces = replicate ((n - length s) `div` 2) ' '

-- http://www.haskell.org/haskellwiki/Blow_your_mind, Ctrl-F "pascal"
pascal :: [[Int]]
pascal = iterate (\row -> zipWith (+) ([0] ++ row) (row ++ [0])) [1]

main :: IO ()
main = mapM_ putStrLn $ ((flip center 70 . unwords) . map show) <$> take 16 pascal

-- equivalently, more elaborated
main' = display $ prettify $ stringify $ take 18 pascal
    where stringify = (fmap . fmap) show
          prettify = fmap (flip center 40 . unwords)
          display = mapM_ putStrLn

{-
                   1                   
                  1 1                  
                 1 2 1                 
                1 3 3 1                
               1 4 6 4 1               
             1 5 10 10 5 1             
            1 6 15 20 15 6 1            
          1 7 21 35 35 21 7 1          
         1 8 28 56 70 56 28 8 1         
      1 9 36 84 126 126 84 36 9 1    
-}
{-
in REPL :  
center "sa" 27
take 10 pascal 



-}
