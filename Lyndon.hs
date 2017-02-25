--
--main = print "Hello World"
main = 
--let sq x = x * x

   print  (myAdd 3 4 )
--print  f  [2,3,4]   
--	print myMult 2 3 4
-- print sq 7


myAdd x y = x + y
myTuple = (1,"mjh")
myMult x y z = x*y*z
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

-- type String = [Char]



