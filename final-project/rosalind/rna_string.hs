transcribed_rna :: [Char] -> [Char]
transcribed_rna dna = [if n == 'T' then 'U' else n | n <- dna]