module Qsort
    ( qsort
    )
    where

-- quichesort a la haskell
{-
qsort (list) --sort said list
cons(filter(car(list) < cdr(list))
     filter(car(list) = cdr(list))
     filter(car(list) > cdr(list)))
-}

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = (qsort (filter (< x) xs )) ++
                      (filter (==x) (x:xs)) ++
               (qsort (filter (> x) xs ))



qsort' :: (Ord a) => [a] -> [a]
qsort' [] = []
qsort' (x:xs) = (sortSplit (< x) xs ) ++ (filter (==x) (x:xs)) ++ (sortSplit (> x) xs )
    where sortSplit f lst = qsort (filter f lst)

