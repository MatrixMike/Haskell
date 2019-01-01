{-# OPTIONS_GHC -fwarn-missing-signatures #-}

capacitor1 :: Double
capacitor1 = 10e-6 -- 10uF

capacitor2 :: Double
capacitor2 = 10e-9 -- 10nF

resistor1 :: Double
resistor1 = 8.2e3

resistor2 :: Double
resistor2 = 8.2e3

capacitor1a :: Double
capacitor1a = 10e-6 -- 10uF

capacitor2a :: Double
capacitor2a = 10e-9 -- 10nF

resistor1a :: Double
resistor1a = 1e3

resistor2a :: Double
resistor2a = 2e3

main :: IO ()
main = do
  print capacitor1
  print capacitor2
  print resistor1
  print resistor2
  print capacitor1a
  print capacitor2a
  print resistor1a
  print resistor2a
  print $ 1.44 / ((resistor1 + (2 * resistor2)) * capacitor2)
  print $ 1.44 / ((resistor1a + (2 * resistor2a)) * capacitor1a)
