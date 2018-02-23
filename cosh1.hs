

--catenary :: 
catenary a x = a * cosh ( a / x ) 


main :: IO()
main = do
    print [cosh x | x <- [0.1, 0.2.. 2.0]]
