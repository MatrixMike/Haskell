-- main = print "Hello, World"
-- 01.09.2016 22:42:19
-- checkout the use of {} around block of do
 
-- haskell.org
main = do 
    --let myMap :: (a -> b ) -> [a] -> [b]
    --let myMap f [] = []
    --let myMap f (x:xs) = f x : myMap f xs
    putStrLn "Hello"
    putStrLn "Line 2: "
--   let myVariable = 3
--   myVariable :: Int
--    myVariable = 3
    let inc x = x + 1
    putStrLn ( "a show line " ++ show (inc 3))
    let sq x = x * x
    let sqinc x = inc x * inc x
    print myVariable
    let ans = sqinc 4
    print ans
    printNumbers
    putStrLn (show (degrees 20))
    putStrLn (show (inc 10))
--putStrLn (show myMap     <finish this Mike
    
 --   print sqinc 4
 --   putStrLn ans
printNumbers = do
    putStrLn (show (3+4))
--    let inc x = x + 1
--    let sq x = x * x
--    let sqinc x = inc x * inc x
    putStrLn ( show ( myMap inc [2,3,4]))
    putStrLn ( show ( myMap sqinc [2,3,4]))
    putStrLn (show (sqinc 4))
    putStrLn (show (xposs))
    putStrLn (show (dposs))
    putStrLn (show (liIonD))
    putStrLn ("LiIon cells")
    putStrLn ( show (liIonI))   
    putStrLn ( show (37/10)) 
    putStrLn ("Now some lambda work..")
    putStrLn ( show (map (\x -> x+1)[ 7,5..  -6 ]))   -- lambda
    
{-| Converts degrees into the standard angle measurement (radians). -}
degrees :: Double -> Double
degrees n = n * pi / 180
myMap :: (a -> b ) -> [a] -> [b]
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
xposs = [-42, -36 .. myVariable2]

dposs :: [Double]
dposs = [-42.0, -36.1 .. 10.0]
    -- xposs = [-42, -36 .. 12]
-- putStrLn (xposs)

--yposs :: [Int]
--yposs = [-42, -36 .. 12][1,2,3]
liIonD :: [Double]
liIonD = [3.7, 7.4 .. 30]

liIonI :: [Int]
liIonI = [37, 74 .. 300]

--Linc :: Int -> Int
--Linc \x -> x + 1

-- invaderPoss = map (\x -> (x, yy)) xposs

    

