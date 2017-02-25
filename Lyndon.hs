--
--main = print "Hello World"
{-
multiple line comments
-}

import GHC.Generics
main = 
--let sq x = x * x

   print  (myAdd 3 4 )
--print  f  [2,3,4]   
--	print myMult 2 3 4
-- print sq 7


myAdd x y = x + y
myTuple = (1,"mjh")
{-
myMult3 :: Int -> (Int -> (Int ->Int))     -- curry  check with hlint
myMult3 x y z = x*y*z
-}

list1 :: [Integer]
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

-- type myString1 = [Char]

--myAdd :: 
--myAdd2 x y =  x+y
myInc :: Int -> Int
myInc  x=x+1

myMult4 :: Int -> (Int -> (Int -> (Int -> Int)))
myMult4 a b c d = a*b*c*d

list5 :: [Integer]   -- swap Int for Integer
list5 = [1,2,32378387382732378372323232323]

--     [row1, row2, row3, row4, row5 ] = map createRow (zip [-20,-14..4] [red, blue, blue, green, green])

data MyBool = MyTrue | MyFalse | MyNotSure
--data MyNumberList = Nada | SomeNumbers Int MyNumberList
data MyNullString = Nada | MyString String
stringy :: MyNullString
stringy = MyString "Whatever, It's just a string"
data MyData = SuperGreat deriving (Show)
{-
(+) :: Num a => a -> a -> a
read :: Read a => String -> a

incrementAndshow :: (Num a, Show a) => a -> String
-}
data Rating = 
  SoAwesomeICried |
  PrettyCool      |
  Meh             |
  ForTheLoveOfGodMakeItEnd
  deriving Show

class Rateable r where
  rating :: r -> Rating


data Beer = Coopers | Fosters | CarltonDraught
  deriving Show

instance Rateable Beer where
  rating Coopers = PrettyCool
  rating Fosters = ForTheLoveOfGodMakeItEnd
  rating CarltonDraught = Meh


data Movie = Movie String
  deriving Show

instance Rateable Movie where
  rating (Movie "Bladerunner") = SoAwesomeICried
  rating (Movie "Tron") = PrettyCool
  rating _ = Meh
data Color = Color Double Double Double Double deriving (Show, Eq, Ord, Read)
data InvaderState = InvaderState { ix :: Double
                                 , iy :: Double
                                 , color :: Color
                                 , killed :: Bool
                              --   , elapsed :: Time
                                 } deriving (Read, Show, Eq)

--  getLine >>= (\name -> putStrLn ("Hello " ++ name))
--putStr "Hello " >>= (\_ -> putStrLn "World")

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
