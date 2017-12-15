{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{-
https://www.allaboutcircuits.com/textbook/alternating-current/chpt-6/parallel-tank-circuit-resonance/
-}
capacitor :: Double
capacitor = 10e-6 -- 10uF

inductor :: Double
inductor =  115e-6      -- 100e-3 -- 100mH

frequency :: Double
frequency = 1 / (2 * pi * sqrt (capacitor * inductor))

main :: IO ()
main = do
  print frequency
