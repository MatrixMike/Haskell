{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Char
import Control.Applicative
-- http://zvon.org/other/haskell/Outputprelude/foldr_f.html
list :: [Integer]
--list = [1, 2, 3, 4, 5]
list = [1..5]
x = [1..5]
y = ['a'..'e']
--let x = 41

main :: IO ()
main = do

    print list

    print $ head list
    print $ tail list
    print $ last list
    print $ init list

    print $ list !! 3
    print $ elem 3 list

    print $ length list
    print $ null list
    print $ reverse list

    print $ take 2 list
    print $ drop 2 list

    print $ minimum list
    print $ maximum list

    print $ sum list
    print $ product list

    print [1..10]
    print ['A'..'Z']
    print [2,4..20]

    print $ take 10 $ cycle [1..4]
    print $ map (+1) list

    print $ filter (>3) list
    print $ all even list
    print $ any odd list

    print $ foldr (+) 0 list
    print $ foldr1 (+) list
    print $ foldr1 (\x y -> (x+y)/2) [12,4,10,6] 

    print $ foldl (+) 0 list
    print $ foldl1 (+) list

    print $ scanr (+) 0 list
    print $ scanr1 (+) list

    print $ scanl (+) 0 list
    print $ scanl1 (+) list

    print $ take 10 $ repeat 0
    print $ replicate 10 0
    print $ drop 3 list

    print $ ['a', 'b'] ++ ['c']
    print $ zip [1, 2, 3] ['a', 'b', 'c']
    print $ unzip [(1, 'a'), (2, 'b'), (3, 'c')]
    print $ zipWith (+) [1, 2, 3] [4, 5, 6]
    print [(x, y) | x <- [1..5], y <- ['a'..'e']]
 --   print [ x/y | x <- [1..5], y <- ['a'..'e']]

    print $  zipWith  (+) x  [5.0,6,7,8]
    print $  zipWith  (/) x  [5.0,6,7,8]
    print $  zipWith  (-) x  [5.0,6,7,8]

    print $ words "Hello world"
    print $ unwords ["Hello", "world"]
    print $ fmap (* 0.5) [1..6]
    print list
--    print $ fmap (* 0.5) list    -- why does this NOT work?

--    print $ isAlpha x

