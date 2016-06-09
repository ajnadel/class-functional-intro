--main = do
--    putStrLn "Wats ur kik?"
--    name <- getLine
--    putStrLn ("@" ++ name ++ " send n00dz")

returnLongest :: [String] -> String
returnLongest [] = ""
returnLongest (x:xs) = if (length x) > (length longestOfRest) then x else longestOfRest
                          where longestOfRest = returnLongest xs

main = do
    input <- getContents
    print $ returnLongest $ lines input