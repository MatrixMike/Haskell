{-# START_FILE main.hs #-}
import System.Process

main = do
    system "javac Main.java"
    system "java Main"

{-# START_FILE Main.java #-}
{-public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
-}
