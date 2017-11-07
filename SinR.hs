--     
--radius :: Floating -> Floating -> Floating
-- 11.10.2017 00:24:13
{-module SinR 
    (
    sroot
    )
    where
-}
   
x::Int
x=3

y::Int
y=4

sroot :: Int -> Int -> Float
sroot x y = sqrt(fromIntegral x * fromIntegral x + fromIntegral y * fromIntegral y)

bg :: [Double]
bg = (/)  <$> [22.0, 32.0, 42.0] <*> [26, 23, 21, 19, 17, 15, 13, 12]



main = do
    print $  sroot 3 4
    print [y+x^2 | x <- [1,2..7]]
    print $ sroot x y 
--    print  sroot (x, y)
--    print [sroot x  y |y <- [1,2..7]]    -- good
    print [sroot x y | x <- [1,2.. 6], y <- [1,2..7]]
      -- list comprehension on one argument  
    --map sroot (x,y) [x | x <- [1,2.. 6], y |y <- [1,2..7]]
    --  Use ParallelListComp
 --   print bg  --good
    
    
    

   
