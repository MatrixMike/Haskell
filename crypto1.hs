{-# OPTIONS_GHC -fwarn-missing-signatures #-}
-- stack --resolver lts-9.3 script
import qualified Data.ByteArray          as BA
import           Data.ByteArray.Encoding (convertToBase, Base (Base16))
import           Data.ByteString         (ByteString)
import           Data.Text.Encoding      (encodeUtf8)
import qualified Data.Text.IO            as TIO
import           System.IO               (hFlush, stdout)

main :: IO ()
main = do
  putStr "Enter some text: "
  hFlush stdout
  text <- TIO.getLine
  let bs = encodeUtf8 text
  putStrLn $ "You entered: " ++ show bs
  let encoded = convertToBase Base16 bs :: ByteString
  putStrLn $ "Converted to base 16: " ++ show encoded
