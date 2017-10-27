{-# OPTIONS_GHC -fwarn-missing-signatures #-}

main :: IO()
main =  do
    let a = [1, 2, 3]
    let  b = [4, 5, 6]   --     let a <- [1, 2, 3]
    -- study difference between = and <- 
    print a 
    print b 
    print  4      --    a  --      * 10 + b
  
  
