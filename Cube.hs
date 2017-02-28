    module Geometry.Cube  
    ( volume  
    , area  
    ) where  
      
    import qualified Geometry.Cuboid as Cuboid  
      
    volume :: Float -> Float  
    volume side = Cuboid.volume side side side  
      
    area :: Float -> Float  
    area side = Cuboid.area side side side  
    
--main = do
    --putStrLn ( show (zip [1,2,3] ["a","b","f"]))
--putStrLn (7)
--Cuboid.area (2.0 3.0 4.0)

