--
--main = print "Hello World"
{-
multiple line comments
-}


main = 
--let sq x = x * x

   print  (myAdd 3 4 )
--print  f  [2,3,4]   
--	print myMult 2 3 4
-- print sq 7


myAdd x y = x + y
myTuple = (1,"mjh")

myMult3 :: Int -> (Int -> (Int ->Int))     -- curry  check with hlint
myMult3 x y z = x*y*z


list1 = [1,2,3]
list2 = 1 : 2 : []
list3 = "first" : "second" : []

f (x:xs) = x
myLength [] = 0
mylength (x:xs) = 1 + mylength xs

myFilter f []     = []
myFilter f (x:xs) = if f x then x : myFilter f xs
                           else     myFilter f xs
                           
myTuple1 :: (String, Int)
myTuple1 = ("The meaning of life", 42)

myTuple2 :: (Int, String, Int, String)
myTuple2 = (3,"asd",6,"iuiu")


myFloat :: (Float)
myFloat = 1.1

-- type myString1 = [Char]

--myAdd :: 
--myAdd2 x y =  x+y
myInc :: Int -> Int
myInc  x=x+1

myMult4 :: Int -> (Int -> (Int -> (Int -> Int)))
myMult4 a b c d = a*b*c*d






