    module Geometry.Cube  
    ( volume  
    , area  
    ) where  
      
    import qualified Geometry.Cuboid as Cuboid  
      
    volume :: Float -> Float  
    volume side = Cuboid.volume side side side  
      
    area :: Float -> Float  
    area side = Cuboid.area side side side  
    
-- main = putStrLn (
	Cuboid.area (2.0 3.0 4.0)

