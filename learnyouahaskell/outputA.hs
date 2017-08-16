import Data.List
import System.Directory
import System.Environment
import System.IO

{-
./outputA view haiku.txt
https://downloads.haskell.org/~ghc/6.12.2/docs/html/libraries/containers-0.3.0.0/Data-Map.html
https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-List.html
-}
dispatch :: [(String, [String] -> IO ())]
dispatch = [("add", add), ("view", view), ("remove", remove)]
{- 16.08.2017 21:17:10
usage :   (action>    <filename>  <data to add>
 e.g. view filename
 e.g. remove filename <linenumber - 1>
-}
main = do
  (command:args) <- getArgs
  let (Just action) = lookup command dispatch
  action args

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks =
        zipWith (\n line -> show (n + 1) ++ " - " ++ line) [0 ..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  handle <- openFile fileName ReadMode
  (tempName, tempHandle) <- openTempFile "." "temp"
  contents <- hGetContents handle
  let number = read numberString
      todoTasks = lines contents
      newTodoItems = delete (todoTasks !! number) todoTasks
  hPutStr tempHandle $ unlines newTodoItems
  hClose handle
  hClose tempHandle
  removeFile fileName
  renameFile tempName fileName
