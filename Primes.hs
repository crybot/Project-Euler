module Primes where

import Data.List
import Data.List.Ordered (minus, union, unionAll)
import Data.Set (fromList, toList)
import Prelude

primes :: [Int]
primes =
  2 :
  3 : minus [5,7 ..] (unionAll [[p * p,p * p + 2 * p ..] | p <- tail primes])

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n $ takeWhile (<= n `div` 2) primes
  where
    primeFactors' n [] = []
    primeFactors' 1 ps = []
    primeFactors' n all@(p:ps)
      | n `mod` p == 0 = p : primeFactors' (n `div` p) all
      | otherwise = primeFactors' n ps

combinations :: [Int] -> [[Int]]
combinations xs = concatMap (combinations' xs) [1 .. length xs]
  where
    combinations' _ 0 = [[]]
    combinations' xs n =
      [y : ys | y:xs' <- tails xs, ys <- combinations' xs' (n - 1)]

divisors :: Int -> [Int]
divisors 0 = [1]
divisors n = (1 :) $ toList . fromList . (n :) . map product $ combinations ps
  where
    ps = primeFactors n
