{-# OPTIONS_GHC -fwarn-missing-signatures #-}

{-
https://
-}
capacitor :: Double
capacitor = 10e-6 -- 10uF

inductor :: Double
inductor =  115e-6      -- 100e-3 -- 100mH

frequency :: Double
frequency = 1 / (2 * pi * sqrt (capacitor * inductor))

pf :: Double -- forward power
pf = 10

pr :: Double -- reflected power
pr = 0.4

vswr :: Double
vswr = (sqrt pf + sqrt pr) / (sqrt pf - sqrt pr)

main :: IO ()
main = do
  print frequency
  print vswr
  
