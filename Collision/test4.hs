{-module Collision
   (
   collidesWith
   )
   where
-}
{-
24.03.2020 20:09:22
create separate points
apply these points to collidesWith

-}
p0 :: [(Double, Double)]
p0 = [(3.0, 4.9), (3.1, 4.8)]
-- explain the line above

p1 :: [(Double, Double)]
p1 = [(0,0),(0,100),(250,200),(200,0)]
-- explain the line above

p2 :: (Double, Double)
p2 = (3.0, 4.9)

p3 :: (Double, Double)
p3 = (3.0, 4.9)

collidesWith :: (Double, Double) -> (Double, Double) -> Bool
collidesWith (x,y) (x',y') = (x'-x)^2 + (y-y')^2 < collisionRadius^2
-- explain the line above
  where
    collisionRadius = 4

x  = collidesWith(3.0, 4.9) (3.1, 5.8)
   
main :: IO()
main = do
    print 6
    print   $  collidesWith(3.0, 4.9) (3.1, 4.8)
    print   $  collidesWith p2    p3
    print   $  collidesWith(3.0, 4.9) (3.1, 9.8)
    print x
  
    
    
