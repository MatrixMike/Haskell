main = do
    mapM print [1, 2, 3, 4, 5, 6]
    sequence (map print [1, 2, 3, 4, 5, 6])
