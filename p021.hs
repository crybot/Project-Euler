import Control.Monad.State
import qualified Data.IntMap as M
import Primes

sumDiv :: Int -> Int
sumDiv 1 = 0
sumDiv n = sum (init $ divisors n)

amicable :: Int -> Bool
amicable a = a /= sda && sdb == a
  where
    sda = sumDiv a
    sdb = sumDiv sda

amicables :: Int -> [Int]
amicables n = filter amicable [1 .. n - 1]

main :: IO ()
main = print . sum $ amicables 10000
