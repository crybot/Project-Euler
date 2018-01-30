module Primes where

import Data.List
import Data.List.Ordered (minus, union, unionAll)
import Data.Set (fromList, toList)
import Prelude
import Control.Monad
import Control.Monad.ST
import Data.Array.ST
import Data.Array.Unboxed

primes :: [Int]
primes =
  2 :
  3 : minus [5,7 ..] (unionAll [[p * p,p * p + 2 * p ..] | p <- tail primes])

-- Strict version of Eratosthenes' sieve implemented using unboxed mutable
-- arrays
primes' :: Int -> [Int]
primes' n = map fst $ filter snd (assocs sieve)
  where
    sieve =
      runSTUArray $ do
        arr <- newArray (2, n) True :: ST s (STUArray s Int Bool)
        forM_ [4,6 .. n] (\i -> writeArray arr i False) -- even numbers
        forM_ [3,5 .. isqrt n] (\i -> do
          p <- readArray arr i
          when p $
            forM_ [i * i,i * i + 2 * i .. n] (\k -> writeArray arr k False))
        return arr
    isqrt = floor . sqrt . fromIntegral 

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
