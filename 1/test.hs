module Test where
    myExpr :: String
    myExpr = "Hello World!"
    myFunction input = "Hello " ++ input ++ "!"
    myFriendFunction = myFunction "Friend"

    main :: IO()
    main = do 
        putStrLn myFriendFunction