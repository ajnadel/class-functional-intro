find_m_helper :: [Char] -> [Char] -> Int -> [Int] -> [Int]
find_m_helper [] _ _ indices = indices
find_m_helper dna motif i indices = find_m_helper (tail dna) motif (i+1) (if last == motif then i:indices else indices)
                                    where last = take (length motif) dna

find_m :: [Char] -> [Char] -> [Int]
-- note that the DNA in the problem is 1-indexed, so 1 is the initial value for i
find_m dna motif = find_m_helper dna motif 1 []
