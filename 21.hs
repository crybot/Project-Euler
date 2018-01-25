import qualified Data.IntMap as M
import Control.Monad.State

type S = State (M.IntMap [Int])

divisors :: Int -> S [Int]
divisors 1 = return []
divisors n = do
  m <- get
  if n `M.member` m
    then return (m M.! n)
    else do
      let ds = [d | d <- [1 .. n `div` 2], n `mod` d == 0]
      modify (M.insert n ds)
      return ds

sumDiv :: Int -> S Int
sumDiv n = sum <$> divisors n

amicable :: Int -> S Bool
amicable a = do
  sda <- sumDiv a
  sdb <- sumDiv sda
  return (a /= sda && sdb == a)

amicables :: Int -> S [Int]
amicables n = filterM amicable [1..n-1]

main :: IO ()
main = print $ evalState (amicables 10000) M.empty
