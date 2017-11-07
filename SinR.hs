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



main = do
    print $  sroot 3 4
    print [y+x^2 | x <- [1,2..7]]
    print [sroot x y |y <- [1,2..7]]  -- list comprehension on one argument 
    

   
