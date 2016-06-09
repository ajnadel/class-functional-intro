import Data.List.Split (splitOn)
import Data.List (sortBy,find)
import qualified Data.Text as T
import RNATranslation (translate_rna)

strip :: String -> String
strip input = (T.unpack . T.strip . T.pack) input

join :: [String] -> String
join s = foldr (++) [] s

headAndJoinedTail :: String -> (String, String)
headAndJoinedTail x = let l = lines x in (head l, join $ tail l)

parseDataset :: [Char] -> [(String, String)]
parseDataset input = map (headAndJoinedTail) (tail $ splitOn ">" (strip input))

removeIntrons' :: [Char] -> String -> [String] -> String
removeIntrons' [] buffer introns = buffer
removeIntrons' mrna buffer introns = case find (\x -> take (length x) mrna == x) introns of
                                        Just intron -> removeIntrons' (drop (length intron) mrna) buffer introns
                                        Nothing -> removeIntrons' (tail mrna) (buffer ++ [head mrna]) introns

removeIntrons mrna introns = removeIntrons' mrna "" introns

main = do
    input <- getContents
    let (mrna:introns) = map (snd) $ parseDataset input
    --putStrLn mrna
    --putStrLn $ show introns
    putStrLn $ removeIntrons mrna introns