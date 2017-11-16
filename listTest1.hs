
import Control.Monad
--do c <- s
--   return (toUpper c)

main = print $ do i <- [1,2]
                  j <- [1..4]
                  return (i,j)
   
