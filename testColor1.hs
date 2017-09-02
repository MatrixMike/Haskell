{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main :: IO()
main = do
    print (myAdd 4 3)
    print $ rgba 100 99 98 97

{-myAdd :: forall a Num a => a -> a -> a   added after suggestion from OPTIONS -}
myAdd x y = x + y

{-| A bright red Colour. -}
data Colour =
  Colour Double
         Double
         Double
         Double
  deriving (Show, Eq, Ord, Read)

{-| Creates an RGB Colour. -}
rgb :: Double -> Double -> Double -> Colour
rgb r g b = rgba r g b 1

red :: Colour
red = rgb 1 0 0

{-| Creates an RGB Colour, with transparency. -}
rgba :: Double -> Double -> Double -> Double -> Colour
rgba r g b a
  | r < 0 || r > 1 || g < 0 || g > 1 || b < 0 || b > 1 || a < 0 || a > 1 =
    error "FRP.Helm.Color.rgba: colour components must be between 0 and 1"
  | otherwise = Colour r g b a
