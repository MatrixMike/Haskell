{-| A bright red color. -}
data Color = Color Double Double Double Double deriving (Show, Eq, Ord, Read, Generic)
{-| Creates an RGB color. -}
rgb :: Double -> Double -> Double -> Color
rgb r g b = rgba r g b 1

red :: Color
red = rgb 1 0 0

{-| Creates an RGB color, with transparency. -}
rgba :: Double -> Double -> Double -> Double -> Color
rgba r g b a
  | r < 0 || r > 1 ||
    g < 0 || g > 1 ||
    b < 0 || b > 1 ||
    a < 0 || a > 1 = error "FRP.Helm.Color.rgba: color components must be between 0 and 1"
  | otherwise = Color r g b a
  
