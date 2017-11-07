{-# OPTIONS_GHC -fwarn-missing-signatures #-}

-- (\x y -> x + y) 3 5
addOneList' :: Num b => [b] -> [b]
addOneList' lst = map (\x -> x + 1) lst

myList :: [Integer]
myList = [3,4,6,7]

main :: IO()
main = do
    print $ (\x -> x + 1) 4
    print myList
    print $ addOneList' myList
    

-- for x11-example consider a list (of offsets) that we call a function drawLine on
-- http://dobegin.com/lambda-functions-everywhere/
-- https://www.haskell.org/tutorial/functions.html

