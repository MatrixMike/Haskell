-- It is generally a good idea to keep all your business logic in your library
-- and only use it in the executable. Doing so allows others to use what you
-- wrote in their libraries.
import qualified Example

main :: IO ()
main = Example.main


import Data.List

main =   do 
       putStrLn (hanoi 4)
       putStrLn "spacer\n"
       putStrLn (hanoi 3)
       putStrLn ("abcdefg" `intersect` "mhjngdopiu")
       
