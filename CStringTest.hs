{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import qualified Foreign.C.String as String

newCString :: [Char]
newCString  =  "Testé"

main :: IO ()
main = do
    putStrLn "start"
    putStrLn newCString



