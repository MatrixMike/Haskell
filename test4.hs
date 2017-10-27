collidesWith :: (Double, Double) -> (Double, Double) -> Bool
collidesWith (x,y) (x',y') = (x'-x)^2 + (y-y')^2 < collisionRadius^2
  where
    collisionRadius = 4

x  = collidesWith((3.0), (4.9)) ((3.1), (4.8))
    
main :: IO()
main = do
    print 6
    print   $  collidesWith((3.0), (4.9)) ((3.1), (4.8))
    print   $  collidesWith((3.0), (4.9)) ((3.1), (9.8))
    
