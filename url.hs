import Network.URI

{-
cabal install uri          : did NOT work
cabal install url          : did NOT work
cabal install network-uri  : DID work 
https://hackage.haskell.org/package/network-uri
-}
main
--  let s = "postgres://user:pass@host.com:5432/path?k=v#f"
 = do
  let s = "postgres://mike:pass@host.com:1234/path?k=v#f"
  case parseURI s of
    Nothing -> error "no URI"
    Just uri -> do
      putStrLn $ uriScheme uri
      case uriAuthority uri of
        Nothing -> error "no Authority"
        Just auth -> do
          putStrLn $ uriUserInfo auth
          putStrLn $ uriRegName auth
          putStrLn $ uriPort auth
      putStrLn $ uriPath uri
      putStrLn $ uriFragment uri
      putStrLn $ uriQuery uri
