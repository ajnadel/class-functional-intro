import Data.List.Split (splitOn)
import Data.List (sortBy)
import qualified Data.Text as T

gc_count :: [Char] -> Int
gc_count s = foldl (\acc cur -> if cur == 'G' || cur == 'C' then acc + 1 else acc) 0 s

--gc_content :: Fractional a => [Char] -> a
gc_content s = (fromIntegral (gc_count s) :: Float) / (fromIntegral (length s) :: Float)

strip :: String -> String
strip input = (T.unpack . T.strip . T.pack) input

join :: [String] -> String
join s = foldr (++) [] s

decimalToPercent :: Float -> Float
decimalToPercent x = x * 100

headAndJoinedTail :: String -> (String, String)
headAndJoinedTail x = let l = lines x in (head l, join $ tail l)

parseDataset :: [Char] -> [(String, String)]
parseDataset input = map (headAndJoinedTail) (tail $ splitOn ">" (strip input))

highestGCContent :: [(String, String, Float)] -> (String, Float)
highestGCContent xs = let (id,_,gc) = last $ sortBy (\(_,_,gcA) (_,_,gcB) -> compare gcA gcB) xs in (id,gc)

gc_content_for_tuples :: [(String, String)] -> [(String, String, Float)] 
gc_content_for_tuples dnas = map (\(x,y) -> (x, y, gc_content y)) dnas

main = do
    input <- getContents
    let (id, gc) = highestGCContent $ gc_content_for_tuples $ parseDataset input
    putStrLn id
    putStrLn $ show $ decimalToPercent gc

