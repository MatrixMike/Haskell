collidesWith :: (Double, Double) -> (Double, Double) -> Bool
collidesWith (x,y) (x',y') = (x'-x)^2 + (y-y')^2 < collisionRadius^2
  where
    collisionRadius = 4
    
main = do
    putStrLn( show (collidesWith(3,4)))
    
