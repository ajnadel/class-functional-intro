
count_rabbits :: Int -> Int -> Int
count_rabbits 0 _ = 0
count_rabbits 1 _ = 1
count_rabbits g k = count_rabbits (g - 1) k + count_rabbits (g - 2) k * k
