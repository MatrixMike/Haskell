    xposs = [-42, -36 .. 12]
-- mini mod MikeH
    [row1, row2, row3, row4, row5 ] = map createRow (zip [-20,-14..4] [red, blue, blue, green, green])
    createRow :: (Double, Color) -> [InvaderState]
    createRow (yy, color) =
      map (\(x, y) -> InvaderState { ix = x, iy = y, color = color
                                   , killed = False, elapsed = 0}) invaderPoss
        where
          invaderPoss = map (\x -> (x, yy)) xposs
