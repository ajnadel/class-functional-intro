
d_H [] [] = 0
d_H (x:dna1) (y:dna2) = if x /= y then 1 + d_H dna1 dna2 else d_H dna1 dna2