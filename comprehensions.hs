-- LIST COMPREHENSION EXCERCISES

--repl n e = take n (cycle [e])
repl n e = [e | x <- [1..n]]

allStrings _ 0 = []
allStrings letters n = [[l] | l <- letters] ++ [l : built | l <- letters, built <- allStrings letters (n-1)]

palindromes strings = [x ++ y | x <- strings, y <- strings, (x ++ y) == reverse (x ++ y)]

factors n = [x | x <- [2..n-1], n `mod` x == 0]

pythagoreanTriads n = let numbersToN = [1..n]
                    in [[a, b, c] | a <- numbersToN, b <- numbersToN, c <- numbersToN, a^2 + b^2 == c^2]

type Coin = Int
coins :: [Coin]
--coins = reverse (sort [1,2,5,10,20,50,100])
coins = [100,50,20,10,5,2,1]

change 0 = []
change n = let largestCoin = head [coin | coin <- coins, coin <= n]
            in largestCoin : change (n-largestCoin)