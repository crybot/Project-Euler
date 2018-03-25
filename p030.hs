import Data.Char

digits :: Int -> [Int]
digits = map digitToInt . show

powerSum :: Int -> Int
powerSum x = sum $ map (^5) (digits x)

-- here a safe upper bound is 10^6 becase 10^n > n*9^5 for all n >= 6
problem30 :: Int
problem30 = sum [ x | x <- [2..10^6], x == powerSum x]

main :: IO ()
main = print problem30
