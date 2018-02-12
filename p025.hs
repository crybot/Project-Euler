digits :: (Show a, Integral a) => a -> Int
digits = length . show

memoizedFib :: Int -> Integer
memoizedFib = (map fib [0..] !!)
    where
        fib 1 = 1
        fib 2 = 1
        fib n = memoizedFib (n-1) + memoizedFib (n-2)

problem25 = length (takeWhile (<1000) (map (digits . memoizedFib) [1..])) + 1
