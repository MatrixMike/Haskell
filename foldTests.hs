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

-- foldr , foldl could be read as fold from RIGHT, fold from LEFT

main :: IO ()
main = do
    print $ foldr (-) 0 [2,3,4] 
    print $ foldl (-) 0 [2,3,4]
--    print $ foldl (-) 0 [2,3,4]
--    print $ foldr (-) 
    print "xx"
    print $ foldr1 (\x y -> (x+y)/2) [12,4,10,6]
    
