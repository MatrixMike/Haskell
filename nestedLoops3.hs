
import Control.Applicative

main = print  liftM2 (\a b -> a * 10 + b) [1..3] [4..6]
