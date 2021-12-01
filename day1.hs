-- module Main where 

import System.IO

main = do 

  -- step 1
  handle <- openFile "day1.txt" ReadMode
  contents <- hGetContents handle
  let depths = map readInt . words $ contents
  let deltas = zip depths (tail depths)
  let arePositive = map isPositiveDelta deltas
  let zoop = filter (== True) arePositive 
  let c = length zoop
  print c

  -- step 2
  let zipped = zip3 depths (tail depths) (drop 2 depths)
  let sums2 = map sumTuple zipped
  let deltas = zip sums2 (tail sums2)
  let arePositive = map isPositiveDelta deltas
  let zoop = filter (== True) arePositive 
  let c = length zoop
  print c

sumTuple :: (Int, Int, Int) -> Int
sumTuple a = (c+d+e) where (c, d, e) = a

isPositiveDelta :: (Int, Int) -> Bool
isPositiveDelta a = case compare (fst a) (snd a) of
  LT -> True
  GT -> False
  EQ -> False

readInt :: String -> Int
readInt = read