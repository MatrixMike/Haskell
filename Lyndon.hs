--
--main = print "Hello World"
{-
multiple line comments
-}
-- import GHC.Generics
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.List

main =  putStrLn("Michael" `intersect` "Hewitt")
--      putStrLn([stations1 intersect stations2])

--       putStrLn(myAdd 4 5)
--let sq x = x * x
--print  (myAdd 3 4 )
--print  f  [2,3,4]   
--	print myMult 2 3 4
-- print sq 7
myAdd x y = x + y

myTuple = (1, "mjh")

sunny = True
{-    if sunny 
    then 1 
    else 0 
    
kindOfBagRequired = 
    case xx
    0 -> "satchel"
    1 -> "bag"
 -}       

{-
myMult3 :: Int -> (Int -> (Int ->Int))     -- curry  check with hlint
myMult3 x y z = x*y*z
-}
list1 :: [Integer]
list1 = [1, 2, 3]

list2 = [1, 2] --  was1 : 2 : []

list3 = ["first", "second"] --  : []

stations1 :: [String]
stations1 =
  [ "werribee"
  , "hoppers crossing"
  , "williams landing"
  , "aircraft"
  , "laverton"
  , "altona"
  , "westona"
  , "altona "
  , "seaholme"
  , "newport"
  , "footscray"
  , "flinders"
  , "southern cross"
  , "flinders"
  ]

stations2 :: [String]
stations2 =
  [ "ararat"
  , "buangor"
  , "beaufort"
  , "trawalla"
  , "burrumbeet"
  , "cardigan village"
  , "wendouree"
  , "ballarat"
  , "ballan"
  , "bacchus marsh"
  , "melton"
  , "ravenhall"
  , "sunshine"
  , "footscray"
  , "southern cross"
  ]

stations3 :: [String]
stations3 =
  ["williamstown", "williamstown beach", "north williamstown", "newport"]

allstations = [stations1, stations2, stations3]

quicksort
  :: (Ord a)
  => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted

f (x:xs) = x

myLength [] = 0

mylength (x:xs) = 1 + mylength xs

myFilter f [] = []
myFilter f (x:xs) =
  if f x
    then x : myFilter f xs
    else myFilter f xs

myTuple1 :: (String, Int)
myTuple1 = ("The meaning of life", 42)

{-
list6 :: [myTuple1]
list6 = (["qwe", 3]:["yui",8])
-}
myTuple2 :: (Int, String, Int, String)
myTuple2 = (3, "asd", 6, "iuiu")

myFloat :: (Float)
myFloat = 1.1

-- type myString1 = [Char]
--myAdd :: 
--myAdd2 x y =  x+y
myInc :: Int -> Int
myInc x = x + 1

myMult4 :: Int -> Int -> Int -> Int -> Int --Int -> (Int -> (Int -> (Int -> Int)))
myMult4 a b c d = a * b * c * d

list5 :: [Integer] -- swap Int for Integer
list5 = [1, 2, 32378387382732378372323232323]

--     [row1, row2, row3, row4, row5 ] = map createRow (zip [-20,-14..4] [red, blue, blue, green, green])
data MyBool
  = MyTrue
  | MyFalse
  | MyNotSure

--data MyNumberList = Nada | SomeNumbers Int MyNumberList
data MyNullString
  = Nada
  | MyString String

stringy :: MyNullString
stringy = MyString "Whatever, It's just a string"

data MyData =
  SuperGreat
  deriving (Show)

{-
(+) :: Num a => a -> a -> a
read :: Read a => String -> a

incrementAndshow :: (Num a, Show a) => a -> String
-}
data Rating
  = SoAwesomeICried
  | PrettyCool
  | Meh
  | ForTheLoveOfGodMakeItEnd
  deriving (Show)

class Rateable r where
  rating :: r -> Rating

data Beer
  = Coopers
  | Fosters
  | CarltonDraught
  deriving (Show)

instance Rateable Beer where
  rating Coopers = PrettyCool
  rating Fosters = ForTheLoveOfGodMakeItEnd
  rating CarltonDraught = Meh

data Movie =
  Movie String
  deriving (Show)

instance Rateable Movie where
  rating (Movie "Bladerunner") = SoAwesomeICried
  rating (Movie "Tron") = PrettyCool
  rating _ = Meh

data Color =
  Color Double
        Double
        Double
        Double
  deriving (Show, Eq, Ord, Read)

data InvaderState = InvaderState
  { ix :: Double
  , iy :: Double
  , color :: Color
  , killed :: Bool
                              --   , elapsed :: Time
  } deriving (Read, Show, Eq)

--  getLine >>= (\name -> putStrLn ("Hello " ++ name))
--putStr "Hello " >>= (\_ -> putStrLn "World")
{-
initialInvaders :: [InvaderState]
initialInvaders =  concat [row1, row2, row3, row4, row5]
  where
    xposs = [-42, -36 .. 12]
-- mini mod MikeH
    [row1, row2, row3, row4, row5 ] = map createRow (zip [-20,-14..4] [red, blue, blue, green, green])
    -- zip takes two lists and returns a list of corresponding pairs
    createRow :: (Double, Color) -> [InvaderState]
    createRow (yy, color) =
      map (\(x, y) -> InvaderState { ix = x, iy = y, color = color
                                   , killed = False, elapsed = 0}) invaderPoss
        where
          invaderPoss = map (\x -> (x, yy)) xposs
-}

--    show ("Michael" `intersect` "Hewitt")

-- show ("Michael" `intersect` "Hewitt")
a = 3.0


--b=3.0
c = 3.0

x = 1.0

pythAodd :: (Double -> Double)
pythAodd a = a

pythBodd1 :: (Double -> Double)
pythBodd1 x = (a * a) - 1

--pythBodd :: (Double -> Double)
--pythBodd b = (pythBodd1 / 2.0)
--pythCodd :: (Int -> Int)
--pythCodd c = b +1
halve
  :: (Fractional d)
  => d -> d
halve x = x * 0.5

listOfLists = [[1, 2], [3, 4], [5, 6]]

-- [8,9]:listOfLists
numbers = [1, 2, 3, 4] -- print (9:numbers)
