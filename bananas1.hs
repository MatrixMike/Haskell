lengthb :: [a] -> Int
lengthb = foldr (\_ n -> n + 1) 0

main :: IO ()
main = print $ lengthb "qwer"
