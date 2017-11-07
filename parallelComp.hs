{-# LANGUAGE ParallelListComp #-}

main = print [ (w, x, y, z) | w <- [1 .. 3],     x <- [2 .. 4]
                            | y <- [3 .. 5],
                              z <- [4 .. 6] ]
