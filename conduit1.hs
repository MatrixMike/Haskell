import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as L

main = simpleHttp "http://www.winsoft.sk" >>= L.putStr
