{-# OPTIONS_GHC -fwarn-missing-signatures #-}

-- (/) :: Fractional a => a -> a -> a

main :: IO()
main = do
    print $ posToXY 3.0 1.2
    print $ posToXYf  3.0 1.2
    

-- main = print 3.0 / 2.0 :: Fractional a => a -> a -> a
posToXY :: Float -> Float -> Integer
posToXY a b = do
        let y = a / b
        round y
        
posToXYf :: Float -> Float -> Float
posToXYf a b = do
        let y = a / b
        y
        
        
