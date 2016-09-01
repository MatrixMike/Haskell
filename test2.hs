-- main = print "Hello, World"
-- 01.09.2016
-- checkout the use of {} around block of do
main = do 
    --let myMap :: (a -> b ) -> [a] -> [b]
    --let myMap f [] = []
    --let myMap f (x:xs) = f x : myMap f xs
    putStrLn "Hello"
    putStrLn "Line 2: "
    let myVariable = 3
    let inc x = x + 1
    let sq x = x * x
    let sqinc x = inc x * inc x
    print myVariable
    let ans = sqinc 4
    print ans
    printNumbers
    
 --   print sqinc 4
 --   putStrLn ans
printNumbers = do
    putStrLn (show (3+4))
    let inc x = x + 1
    let sq x = x * x
    let sqinc x = inc x * inc x
    putStrLn (show (sqinc 4))
    


