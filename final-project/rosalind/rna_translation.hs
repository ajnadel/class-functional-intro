import qualified Data.Map as Map

module RNATranslation where

--codon_table :: Map.Map [Char] [Char]
codon_table = Map.fromList [("UUU", "F"), ("UUC", "F"), ("UUA", "L"), ("UUG", "L"), ("UCU", "S"), ("UCC", "S"), ("UCA", "S"), ("UCG", "S"), ("UAU", "Y"), ("UAC", "Y"), ("UAA", "Stop"), ("UAG", "Stop"), ("UGU", "C"), ("UGC", "C"), ("UGA", "Stop"), ("UGG", "W"), ("CUU", "L"), ("CUC", "L"), ("CUA", "L"), ("CUG", "L"), ("CCU", "P"), ("CCC", "P"), ("CCA", "P"), ("CCG", "P"), ("CAU", "H"), ("CAC", "H"), ("CAA", "Q"), ("CAG", "Q"), ("CGU", "R"), ("CGC", "R"), ("CGA", "R"), ("CGG", "R"), ("AUU", "I"), ("AUC", "I"), ("AUA", "I"), ("AUG", "M"), ("ACU", "T"), ("ACC", "T"), ("ACA", "T"), ("ACG", "T"), ("AAU", "N"), ("AAC", "N"), ("AAA", "K"), ("AAG", "K"), ("AGU", "S"), ("AGC", "S"), ("AGA", "R"), ("AGG", "R"), ("GUU", "V"), ("GUC", "V"), ("GUA", "V"), ("GUG", "V"), ("GCU", "A"), ("GCC", "A"), ("GCA", "A"), ("GCG", "A"), ("GAU", "D"), ("GAC", "D"), ("GAA", "E"), ("GAG", "E"), ("GGU", "G"), ("GGC", "G"), ("GGA", "G"), ("GGG", "G")]

codon_lookup :: [Char] -> [Char]
codon_lookup codon = case Map.lookup codon codon_table of
                        Just amino -> amino
                        Nothing    -> ""

translate_rna :: [Char] -> [Char]
translate_rna [] = []
translate_rna (x:y:z:xs) = if amino == "Stop" then [] else amino ++ translate_rna xs
                               where amino = codon_lookup [x, y, z]