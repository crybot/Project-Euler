import Control.Monad
import Data.Char
import Data.List
import Data.List.Split

names :: String -> [String]
names = map read . splitOn ","

alphaOrder :: Char -> Int
alphaOrder x = subtract (ord 'a' - 1) (ord . toLower $ x)

alphaValue :: String -> Int
alphaValue = sum . map alphaOrder

scores :: [String] -> [Int]
scores xs = [x * i | (x, i) <- zip [1 ..] (map alphaValue $ sort xs)]

main :: IO ()
main = do
  ns <- names <$> readFile "p022_names.txt"
  print $ sum (scores ns)
