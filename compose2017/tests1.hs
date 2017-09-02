{-# OPTIONS_GHC -fwarn-missing-signatures #-}
--  Answer = 1 + 1
answer = 3+2

--myList 
f (x:xs)  = x 

myTuple :: ([Char], Int)  -- why not Char[]
myTuple = ("1212",7)

data MyBool = MyTrue | MyFalse | MyNotSure

data MyNullString 

data MyList a = Empty | Items a (MyList a)

myMult x y z = x * y * z

myFloat :: Float
myFloat = 1.1
name = "mikeH"

main =  do
    putStrLn $ f["Hello"]
    print answer
    print myTuple
    
--   print f ("abcd")
    


