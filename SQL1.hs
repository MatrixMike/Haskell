{-# LANGUAGE OverloadedStrings #-}

import Database.Sqlite

printRows stmt = do
    row <- step stmt
    if row == Done then
        return ()
    else do
        col <- column stmt 0
        print col
        printRows stmt

main = do
    conn <- open "database.db"

    stmt <- prepare conn "DROP TABLE IF EXISTS MyTable;"
    step stmt
    finalize stmt

    stmt <- prepare conn "CREATE TABLE IF NOT EXISTS MyTable (Name VARCHAR(20));"
    step stmt
    finalize stmt

    stmt <- prepare conn "INSERT INTO MyTable(Name) VALUES('Erik');"
    step stmt
    finalize stmt

    stmt <- prepare conn "INSERT INTO MyTable(Name) VALUES('Patrik');"
    step stmt
    finalize stmt

    stmt <- prepare conn "SELECT * FROM MyTable;"
    printRows stmt
    finalize stmt

    close conn
