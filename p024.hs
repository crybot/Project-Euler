import Data.List ((\\))

permutations :: (Eq a) => [a] -> [[a]]
permutations [] = [[]]
permutations xs = [x : ys | x <- xs, ys <- permutations (xs \\ [x])]

-- naive implementation
nthPermutation :: (Ord a, Eq a) => Int -> [a] -> [a]
nthPermutation n xs = permutations xs !! (n-1)

main :: IO ()
main = do
    let xs = map show (nthPermutation 1000000 [0,1,2,3,4,5,6,7,8,9])
    putStrLn $ concat xs
