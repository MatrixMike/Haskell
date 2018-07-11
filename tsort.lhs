\begin{code}
tsort []     = []
tsort (x:xs) = tsort [y | y<-xs, y>x] ++ [x] ++ tsort [y | y<-xs, y<=x]
\end{code}
