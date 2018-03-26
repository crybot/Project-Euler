
-- TODO: memoize
solutions :: Int -> [Int] -> Int
solutions 0 _ = 1
solutions _ [] = 0
solutions n (c:cs) = sum $ map (\x -> solutions (n  - c*x) cs) [0.. n `div` c]

main :: IO ()
main = print $ solutions 200 [1, 2, 5, 10, 20, 50, 100, 200]

