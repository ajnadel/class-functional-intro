
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x-2) + fibonacci (x-1)

-- GET MAX PROFIT problem --> unfinished

-- O(n^2) ~= O(n^2-n(n-1)/2)
get_max_profit' :: [Int] -> Int
get_max_profit' (_:[]) = 0
get_max_profit' (buy:rest) = max (maximum [(x - buy) | x <- rest]) (get_max_profit' rest)

-- O(n), but doesn't work entirely
get_max_profit :: [Int] -> Int
get_max_profit prices = get_max_profit_helper (maxBound :: Int) 0 prices

get_max_profit_helper :: Int -> Int -> [Int] -> Int
get_max_profit_helper buy sell [] = sell-buy
get_max_profit_helper buy sell (cur:rest)
    | cur <= 0 = error "Stock values can not be <= than 0!"
    | cur < buy = get_max_profit_helper cur 0 rest
    | cur > sell = get_max_profit_helper buy cur rest
    | otherwise = get_max_profit_helper buy sell rest

--get_max_profit [10, 7, 5, 8, 11, 9]

--contains :: Foldable t => t a -> a -> Bool
contains lst x = any (== x) lst

--countOccurences :: Foldable t => t a -> a -> Int
countOccurences lst x = foldl (\acc e -> acc + (if e == x then 1 else 0)) 0 lst

get_products_of_all_ints_except_at_index lst = let product = foldl (\acc e -> if e == 0 then acc else acc * e) 1 lst in
                                                let zeroCount = countOccurences lst 0 in
                                                    if zeroCount > 1 then take (length lst) $ repeat 0
                                                        else if zeroCount == 1
                                                            then [if x == 0 then product else 0 | x <- lst]
                                                                    else [product `quot` x | x <- lst]


                                                 

--get_products_of_all_ints_except_at_index lst = [foldl (*) 1  | lst <=
