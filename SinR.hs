--radius :: Floating -> Floating -> Floating
-- 11.10.2017 00:24:13
x::Int
x=3

y::Int
y=4

sroot :: Int -> Int -> Float
sroot x y = sqrt(fromIntegral x * fromIntegral x + fromIntegral y * fromIntegral y)


main = do
    print $  sroot 3 4
    
