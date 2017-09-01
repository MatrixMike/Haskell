{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- main = print "Hello, World"
main :: IO()
main = do 
    putStrLn "Hello"
    putStrLn "Line 2"
  
--myVariable = 2
--putStrLn myVariable

myVariable :: Integer
myVariable = 2
-- print myVariable
-- print myVariable
myTuplePair :: (Integer, [Char])
myTuplePair = (1, "hello")

x:: Integer
x = 3

y:: Integer
y = 4

myAdd :: Num a=> a -> a -> a
myAdd x y = x + y
-- print myAdd
-- list1 []

-- head list2
myFloat :: Float
myFloat = (1.1  :: Float)
-- myMultiply :: Int -> Int -> Int -> Int

myMultiply :: (Int -> Int -> (Int -> Int))
myMultiply x y z = x* y * z

list1 :: [Int]   -- type signature
list1 = [1,2,3,4]

list2 :: [Integer]
list2 = 1: 2 : []

list3 :: [[Char]]
list3 = "hello" : "world" : []

list4 :: [Integer]
list4 = [1,2,3,4,5,6,7,8,9,0]
 -- twolists = list4 ++ list4
 
myHead :: [t] -> t 
myHead (x:xs) = x 
-- also e.g. head
-- myFirstElement = myHead list1
myFirstElement :: Integer
myFirstElement = myHead list4

myLength :: Num a => [t] -> a
myLength[] = 0 
myLength (x:xs) = 1 + myLength xs
-- e.g. myLength list4

myLength1 :: Num a =>  [t] -> a
myLength1[] = 0 
myLength1 (x:xs) = 1 + myLength1 xs

inc :: Num a => a -> a
inc x = x + 1

sq ::  Num a=> a -> a
sq x = x * x

sqinc ::  Num a=> a -> a
sqinc x = inc x * inc x
-- myMap sqinc [1,2,3,4,5]
-- myMap inc [1,2,3]
myMap :: (a -> b ) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs


--lyndon1 
--  putStr "hi there" >> putStr "World"  

