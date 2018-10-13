{-# OPTIONS_GHC -fwarn-missing-signatures #-}
--    {-# START_FILE PropertiesTest.java #-}
import System.Process

{-
GHC.IO.Exception.ExitCode  
-}
--main :: IO ()  
--main :: IO GHC.IO.Exception.ExitCode 
main = do
    system "javac PropertiesTest.java"
    system "java  PropertiesTest"

{-# START_FILE PropertiesTest.java #-}
{-public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
-}
