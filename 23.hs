import Control.Monad (forM_)
import Control.Monad.ST
import Data.Array.ST
import Primes
import Data.Function

sumDiv :: Int -> Int
sumDiv 1 = 1
sumDiv n = sum (divisors n)

abundant :: Int -> Bool
abundant n = sumDiv n - n > n

abundants :: Int -> [Int]
abundants n = filter abundant [1 .. n]

nonAbundantSums :: Int -> [Int]
nonAbundantSums n =
  let sums =
        runST $ do
          arr <- newArray (1, n) False :: ST s (STArray s Int Bool)
          let abunds = abundants n
          let xs = [x + y | x <- abunds, y <- abunds, x + y <= n]
          forM_ xs (\x -> writeArray arr x True)
          getAssocs arr
  in map fst . filter (not . snd) $ sums

main :: IO ()
main = do
  let n = 20161 -- empirical: found by binary search
  print . sum $ nonAbundantSums n
