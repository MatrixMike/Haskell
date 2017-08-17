{-# START_FILE main.hs #-}
import Language.Java.Lexer
import Language.Java.Parser
import Language.Java.Pretty

main = do
    source <- readFile "Main.java"
    print $ lexer source
    print $ parser compilationUnit source

    let result = parser compilationUnit source
    case result of
        Left error -> print error
        Right ast -> putStrLn $ prettyPrint ast
{-# START_FILE Main.java #-}
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
