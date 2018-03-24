import Primes

-- naive trial division algorithm
isPrime :: Int -> Bool
isPrime n 
    | n <= 1 = False
    | otherwise = all (\x -> n `mod` x /= 0) (takeWhile (<= m) primes)
    where m = isqrt n
          isqrt = floor . sqrt . fromIntegral

quadratic :: Int -> Int -> [Int]
quadratic a b = takeWhile isPrime $ map (\n -> n^2 + a*n + b) [0..]

-- n = 0 => b is prime
lengths :: [(Int, Int)]
lengths = [(length $ quadratic a b, a*b) | 
                                         b <- takeWhile (<= 1000) primes, 
                                         a <- filter (f b) [-999.. 999]]
    where f b a = all (\n -> isPrime $ n^2 + a*n + b) [1..40]

main :: IO ()
main = print $ maximum lengths

