sumsq 0 = 0
sumsq n = n ^ 2 + sumsq (n - 1)

sumLinear [] = 0
sumLinear (x:xs) = x + (sumLinear xs)

sumTail lst = sumTailHelper lst 0
sumTailHelper [] total = total
sumTailHelper (x:xs) total = sumTailHelper xs (total + x)

sumFoldr lst = foldr (+) 0 lst