import Data.Digits

digitsSum :: (Integral a) => a -> a
digitsSum = sum . digits 10

fact :: (Integral a) => a -> a
fact 0 = 1
fact n = n * fact (n-1)

main :: IO ()
main = print $ digitsSum (fact 100)

