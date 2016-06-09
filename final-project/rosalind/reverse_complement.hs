complement :: Char -> Char
complement x
    | x == 'A' = 'T'
    | x == 'T' = 'A'
    | x == 'C' = 'G'
    | x == 'G' = 'C'

reverse_complement :: [Char] -> [Char]
reverse_complement s = [complement x | x <- reverse s]