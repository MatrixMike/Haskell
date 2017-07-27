{-# LINE 1 "test1.hs" #-}
-- main = print "Hello, World"
{-# LINE 2 "test1.hs" #-}
-- 01.09.2016
-- checkout the use of {} around block of do
main = do 
    putStrLn "Hello"
    putStrLn "Line 2: "
    let myVariable = 3
    let inc x = x + 1
    let sq x = x * x
    let sqinc x = inc x * inc x
    print myVariable
    let ans = sqinc 4
    print ans
    
 --   print sqinc 4
 --   putStrLn ans


