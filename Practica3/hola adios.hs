main = loop []

loop tareas = do
    putStr "> "
    linea <- getLine
    if linea == "quit"
        then putStrLn "Adios"
        else if linea == "items"
            then mapM_ putStrLn (zipWith (\i t -> show i ++ ". " ++ t) [1..] tareas) >> loop tareas
            else loop (tareas ++ [linea])