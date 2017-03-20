{-| Contains signals that sample input from the mouse. -}
module FRP.Helm.Touch
(
  -- * Types
  Touch(..),
  -- * Position
  positions

) where

import Control.Applicative
import Data.Bits
import Data.Maybe
import Foreign.C.Types -- Remove
import Foreign.Marshal.Alloc
import Foreign.Ptr
import Foreign.Storable
import FRP.Elerea.Param hiding (Signal)
import FRP.Helm.Sample
import FRP.Helm.Signal
import qualified Graphics.UI.SDL as SDL hiding (getTouchFinger)
import qualified Graphics.UI.SDL.Events as SDL


{-| A data structure describing a touch -}
type FingerId = Int
data Touch = Touch FingerId Float Float
  deriving (Show, Eq, Ord, Read)

toTouch :: SDL.Finger -> Maybe Touch
toTouch m = case m of
  SDL.Finger {..} -> Just (Touch (fromIntegral fingerId)
                                 (realToFrac fingerX)
                                 (realToFrac fingerY))
  _               -> Nothing


{-| The current position of the touch in normalized co-ordinates -}
positions :: Signal [(Float, Float)]
positions = Signal $ getPositions >>= transfer (pure []) update
  where
    getPositions = effectful $ do
      fingers <- SDL.getTouchFingers
      return $ map getPos fingers

    getPos :: SDL.Finger -> (Float,Float)
    getPos f = (realToFrac (SDL.fingerX f), realToFrac (SDL.fingerY f))
