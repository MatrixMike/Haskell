

--catenary :: 
catenary a x = a * cosh ( a / x ) 


main :: IO()
main = do
    let a = 0.2
    print [cosh x | x <- [0.1, 0.2.. 2.0]]
    putStrLn "xxx"
    print [catenary a x | x <- [0.1, 0.2.. 2.0]]

