{-# OPTIONS_GHC -fwarn-missing-signatures #-}
--  Answer = 1 + 1
answer :: Integer
answer = 3+2

--myList 
f :: [t] -> t
f (x:xs)  = x 

myTuple :: (String, Int)  -- why not Char[]
myTuple = ("1212",7)

data MyBool = MyTrue | MyFalse | MyNotSure

data MyNullString 

data MyList a = Empty | Items a (MyList a)

--       myMult :: forall a. Num a => a -> a -> a -> a
myMult ::  Num a => a -> a -> a -> a
myMult x y z = x * y * z

myFloat :: Float
myFloat = 1.1

name :: String
name = "mikeH"

main :: IO ()
main =  do
    putStrLn $ f["Hello"]
    print answer
    print myTuple
    print answer
    print $ myMult 2 3 4 
    print myFloat
    print name
    print $ f "abcd"
    
{-
revise & in print
forall in myMult :: forall a. Num a => a -> a -> a -> a
-}


