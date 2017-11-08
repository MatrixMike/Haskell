-- main = print "Hello, World"
-- 01.09.2016 22:42:19
-- checkout the use of {} around block of do
-- haskell.org
--module Game1 where      -- investigate
import GHC.Generics

main
    --let myMap :: (a -> b ) -> [a] -> [b]
    --let myMap f [] = []
    --let myMap f (x:xs) = f x : myMap f xs
 = do
  putStrLn "Hello"
  putStrLn "Line 2: "
  let inc x = x + 1
  putStrLn ("a show line " ++ show (inc 3))
  let sq x = x * x
  let sqinc x = inc x * inc x
  print myVariable
  let ans = sqinc 4
  print ans
  printNumbers   -- see definition further down
  print (degrees 20)
  print (inc 10)
 --   print sqinc 4
 --   putStrLn ans

--   let myVariable = 3

--    putStrLn (show (degrees 20))
--    putStrLn (show (inc 10)) 
--putStrLn (show myMap     <finish this Mike
printNumbers = do
  print (myMap sqinc [2, 3, 4])
  print (sqinc 4)
  print xposs
  print dposs
  print liIonD
  putStrLn "LiIon cells"
  putStrLn (show (liIonI))
  print (37 / 10)
  putStrLn "Now some lambda work.."
  putStrLn (show (map (\x -> x + 1) [7,5 .. -6])) -- lambda
  print (map (+ 1) [7,4 .. -6])
  print (zip [1, 2, 3] [6, 7, 8, 9])
  putStrLn (show (zip [1, 2, 3] ["a", "b", "f"]))

--putStrLn (show (zip [1, 2, 3] [6, 7, 8, 9]))
--putStrLn ( show (zip [1,2,3] ["a","b" ..  "f"]))
--putStrLn $ show $ myMap sqinc [2, 3, 4]
--    putStrLn (show (3+4))
--    let inc x = x + 1
--    let sq x = x * x
--    let sqinc x = inc x * inc x
--    putStrLn ( show ( myMap inc [2,3,4]))
{-| Converts degrees into the standard angle measurement (radians). -}
degrees :: Double -> Double
degrees n = n * pi / 180

myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

--IonTenth :: (Int) -> (Double)
--IonTenth y = y / 10
myVariable :: Int
myVariable = 3

myVariable2 :: Int
myVariable2 = 10

inc :: Int -> Int
inc z = z + 1

sq :: Int -> Int
sq p = p * p

sqinc :: Int -> Int
sqinc x = inc x * inc x

xposs :: [Int]
xposs = [-42,-36 .. myVariable2]

dposs :: [Double]
dposs = [-42.0,-36.1 .. 10.0]
    -- xposs = [-42, -36 .. 12]

-- putStrLn (xposs)
{-
yposs :: [Int]
yposs = [-42, -36 .. 12][1,2,3]
-}
-- range (0,4) => [0,1,2,3,4] 
-- Prelude Data.Array> array ((0,0),(10,12)) [((x,y),x*y) | x<-[0..10], y<-[0..12]]  
--arrayMaker :: (Int, Int) -> [[Int]]
liIonD :: [Double]
liIonD = [3.7,7.4 .. 30]

liIonI :: [Int]
liIonI = [37,74 .. 300]
{-
Linc :: Int -> Int
Linc \x -> x + 1
-}
--invaderPoss = map (\x -> (x, yy)) xposs
--[r1,r2,r3] = map (x=x+1) ( zip [1,2,3] ["a","b","c"]  )

{-array2D :: [Int][Int]
array2D = [1,2,3,4]  [2,3,4]
-}
