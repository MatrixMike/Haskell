import Control.Monad
import Data.Char
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
main = do
    print (map (++ "*") (map (++ "!") ["hey", "ho", "woo"]))
    let lfour =   ["one", "two","three","four"]
    print lfour
    let ll = ["aa","bb"]
    print (head ["one", "two","three","four"])
    print (last ["one", "two","three","four"])
    print (tail ["one", "two","three","four"])
    print (init ["one", "two","three","four"])
    print (length ["one", "two","three","four"])
    print (null ["one", "two","three","four"])
--    print (uncons ["one", "two","three","four"])
    print ( ["one", "two","three","four"] ++ ["x","y"])
    print ( ["one", "two","three","four"] ++ ["y"])   
    let y = "why" 
    print ( ["one", "two","three","four"] ++ [y] ++ ll)    
--    putStrLn $ map toUpper ll
    print (map  (toUpper) (head["one", "two","three","four"]))
--    print (map  (toUpper) ["one", "two","three","four"])
