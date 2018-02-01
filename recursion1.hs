
-- Collatz sequences
chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd  n =  n:chain (n*3 + 1)  
    -- notice the concatenation of an element to a list 

main :: IO ()
main = do
    print $ chain 6
    
