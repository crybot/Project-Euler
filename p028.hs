type Spiral = [[Int]]

spiral :: Int -> Spiral
spiral 0 = [[]]
spiral 1 = [[1]]
spiral n 
    | n `div` 2 /= 0 = [(n-2)^2 + 1 ..n^2] : spiral (n - 2)
    | otherwise = undefined

every :: Int -> [Int] -> [Int]
every _ [] = []
every n (x:xs) = case drop (n-2) xs of
                  (y:ys) -> y : every n ys
                  [] -> []

edges :: Spiral -> [Int]
edges sp = 1 : concatMap (\xs -> every (length xs `div` 4) xs) sp

main :: IO ()
main = print . sum $ edges (spiral 1001)
