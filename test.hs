-- main = print "Hello, World"
main = do 
    putStrLn "Hello"
    putStrLn "Line 2"
    print list4
    

myVariable = 2
-- putStrLn myVariable

myVariableA = 2
-- print myVariable
-- print myVariable
myTuplePair = (1, "hello")
x = 3
y = 4
myAdd x y = x + y
-- print myAdd
-- list1 []

-- head list2

myFloat = (1.1  :: Float)
-- myMultiply :: Int -> Int -> Int -> Int
--myMultiply :: Int -> Int -> (Int -> Int))
myMultiply x y z = x* y * z

list1 :: [Int]   -- type signature
list1 = [1,2,3,4]
list2 = 1: 2 : []
list3 = "hello" : "world" : []
list4 = [1,2,3,4,5,6,7,8,9,0]
 -- twolists = list4 ++ list4
myHead (x:xs) = x 
-- also e.g. head
-- myFirstElement = myHead list1
myFirstElement = myHead list4

myLength[] = 0 
myLength (x:xs) = 1 + myLength xs
-- e.g. myLength list4
myLength1[] = 0 
myLength1 (x:xs) = 1 + myLength1 xs

inc x = x + 1
sq x = x * x
sqinc x = inc x * inc x
-- myMap sqinc [1,2,3,4,5]
-- myMap inc [1,2,3]
myMap :: (a -> b ) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs


--lyndon1 
--  putStr "hi there" >> putStr "World"  

