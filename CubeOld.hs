{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-module Geometry.Cube  
    ( volume  
    , area  
    ) where  
-}
      
import qualified Geometry.Cuboid as Cuboid  
{-main = do {
     --Cuboid.area (2.0 3.0 4.0)
     putStrLn "Hello"
     }
-}
     
volume :: Float -> Float  
volume side = Cuboid.volume side side side  
      
area :: Float -> Float  
area side = Cuboid.area side side side  
    
main :: IO ()
main = do
--    putStrLn ( show (zip [1,2,3] ["a","b","f"]))
--    putStrLn $ area 2.0 3.0 4.0
--    putStrLn $ (7)
    putStrLn   Cuboid.area 2.0 3.0 4.0

