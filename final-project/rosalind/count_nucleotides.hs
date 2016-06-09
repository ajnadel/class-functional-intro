count_nucleotides_helper :: [Char] -> Int -> Int -> Int -> Int -> (Int, Int, Int, Int)
count_nucleotides_helper [] a c g t = (a, c, g, t)
count_nucleotides_helper (nucleotide:rest) a c g t
    | nucleotide == 'A' = count_nucleotides_helper rest (a + 1) c g t
    | nucleotide == 'C' = count_nucleotides_helper rest a (c + 1) g t
    | nucleotide == 'G' = count_nucleotides_helper rest a c (g + 1) t
    | nucleotide == 'T' = count_nucleotides_helper rest a c g (t + 1)

count_nucleotides :: [Char] -> (Int, Int, Int, Int)
count_nucleotides s = count_nucleotides_helper s 0 0 0 0