import qualified Data.Set as S

powers :: Integer -> [Integer]
powers n = [a^b | a <- [2..n], b <- [2..n]]

problem29 :: Integer -> Int
problem29 n = length . S.fromList $ powers n

main :: IO ()
main = print $ problem29 100

