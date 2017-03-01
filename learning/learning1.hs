import Debug.Trace
import Data.List
main =   putStrLn (hanoi 4)

--putStrLn "str1" 
--bmiTell (90 1.77)

--putStrLn("str1" )


factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil"  

{-
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!" 
-}
{-    
myCompare :: (Ord a) => a -> a -> Ordering  
a `myCompare` b  
    | a > b     = GT  
    | a == b    = EQ  
    | otherwise = LT 
-}
    
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
       
initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname           
--  initials "Mike" "Hewitt"
{-
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2  
-}
    
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h =
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea     
-- cylinder 3.0 4.5

-- [let square x = x * x in (square 5, square 3, square 2)]

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x
    
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted 
    
multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z 

numLongChains :: Int  
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))      

chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)    

addThree :: (Num a) => a -> a -> a -> a  
addThree x y z = x + y + z  

-- map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] 

oddSquareSum :: Integer  
oddSquareSum =   
    let oddSquares = filter odd $ map (^2) [1..]  
        belowLimit = takeWhile (<10000) oddSquares  
    in  sum belowLimit  
{-    
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n-1) a c b ++ [(a,c)] ++ hanoi (n-1) b a c
-}
applyMoves ((from,to):nextMoves) pegs | trace ("(from:" ++ show from ++ ", to:" ++ show to ++ ") pegs:" ++ show pegs) False = undefined
applyMoves [] pegs = pegs
applyMoves ((1,2):nextMoves) pegs = applyMoves nextMoves [tail (pegs!!0),         head (pegs!!0):pegs!!1, pegs!!2]
applyMoves ((1,3):nextMoves) pegs = applyMoves nextMoves [tail (pegs!!0),         pegs!!1,                head (pegs!!0):pegs!!2]
applyMoves ((2,1):nextMoves) pegs = applyMoves nextMoves [head (pegs!!1):pegs!!0, tail (pegs!!1),         pegs!!2]
applyMoves ((2,3):nextMoves) pegs = applyMoves nextMoves [pegs!!0,                tail (pegs!!1),         head (pegs!!1):pegs!!2]
applyMoves ((3,1):nextMoves) pegs = applyMoves nextMoves [head (pegs!!2):pegs!!0, pegs!!1,                tail (pegs!!2)]
applyMoves ((3,2):nextMoves) pegs = applyMoves nextMoves [pegs!!0,                head (pegs!!2):pegs!!1, tail (pegs!!2)]
applyMoves (dodgyMove:nextMoves) pegs = error "Invalid moves: "


hanoi :: Int -> String
hanoi n
    | n < 1 = "No moves required to shift zero or negative number of disks\n"
    | otherwise = hanoiMoves n 1 3

hanoiMoves :: Int -> Int -> Int -> String
hanoiMoves 1 fromPeg toPeg = hanoiPrint fromPeg toPeg
hanoiMoves n fromPeg toPeg = hanoiMoves (n-1) fromPeg otherPeg ++ hanoiMoves 1 fromPeg toPeg ++ hanoiMoves (n-1) otherPeg toPeg
    where otherPeg = 6 - toPeg - fromPeg

hanoiPrint :: Int -> Int -> String
hanoiPrint fromPeg toPeg = "Move disk from peg " ++ show fromPeg ++ " to peg " ++ show toPeg ++ "\n"