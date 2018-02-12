import qualified Data.Map as Map
import Data.Maybe

period :: Integer -> Int
period n = period' 0 Map.empty
    where period' e m = 
            let v = 10^e `mod` n in
            case Map.lookup v m of
                Just s -> e - s
                Nothing -> period' (e+1) (Map.insert v e m)

problem26 :: Int
problem26 = snd . maximum $ zip (map period [1 .. 1000 - 1]) [1 ..]

main :: IO ()
main = print problem26
