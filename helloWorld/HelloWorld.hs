{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- http://www.lounge.se/wiki2/show/HaskellChess

--needs:  cabal install Gloss

import Graphics.Gloss
--import Graphics.Gloss.Data.Vector
--import Data.List
--import Graphics.Gloss.Juicy
--import Graphics.Gloss.Interface.Pure.Game
import qualified Foreign.C.String as String

newCString :: String
newCString = "1Testé"

--tBlue =  makeColor8  0 102 255 128
--tGreen = makeColor8 51 255   0 128

textString :: [Char]
--textString = "TeéxtString"
textString = "Coffee time Phyllis"

main :: IO ()
main = do
    let newCString = "TeéxtString"
    putStrLn newCString
    display (InWindow newCString (400, 150) (100, 20)) green picture  -- easily change background colour
-- dimensions of box , location of top left corner y,x (a.o.t. x,y !)



picture :: Picture
picture = Translate (-170) (-20)   -- shift the text to the middle of the window
--    $ Text "World\nTwo"           -- text to display
--   let      secFormatted s = show (s `div` 60) ++ ":" ++ show (s `mod` 60)
    $ Scale 0.25 0.25                -- display it half the original size
    $ Text newCString          -- text to display



