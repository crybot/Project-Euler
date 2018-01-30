import Data.Dates

isSunday :: WeekDay -> Bool
isSunday Sunday = True
isSunday _ = False

oneDay :: Time
oneDay = Time 24 0 0

nextDay :: DateTime -> DateTime
nextDay d = addInterval d (Days 1)

--previousDay :: DateTime -> DateTime
--previousDay d = minusInterval d (Days 1)

fromTo :: DateTime -> DateTime -> [DateTime]
fromTo d1 d2
    | d1 == d2 = []
    | otherwise = d1 : fromTo (nextDay d1) d2

firstOfMonths :: [DateTime] -> [DateTime]
firstOfMonths = filter ((== 1) . day)

sundays :: [DateTime] -> Int
sundays dates = length $ filter isSunday $ map dateWeekDay (firstOfMonths dates)

main :: IO ()
main = do
    let a = DateTime 1901 1 1 0 0 0
    let b = DateTime 2000 12 31 0 0 0
    print $ sundays (fromTo a b)
