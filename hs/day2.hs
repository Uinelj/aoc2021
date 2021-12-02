import System.IO

main = do

  -- part 1 
  handle <- openFile "../txt/day2.txt" ReadMode
  contents <- hGetContents handle
  let w = words contents
  let z = zip w (tail w)
  let r = zip [0..length z] z
  let filtered = snd . unzip $ filter (\(x, _) -> even x ) r

  let att = filter (\(x, _) -> isVerticalCommand x) filtered
  let end_att = sum $ map cvtVerticalCommand att

  let atth = filter (\(x, _) -> isHorizontalCommand x) filtered
  let end_atth = sum $ map cvtHorizontalCommand atth

  print $ end_att * end_atth
  -- part 2
  print att


readInt :: String -> Int
readInt = read

isVerticalCommand :: String -> Bool
isVerticalCommand cmd = case cmd of
  "up" -> True
  "down" -> True
  _ -> False

isHorizontalCommand :: String -> Bool
isHorizontalCommand cmd = case cmd of
  "forward" -> True
  _ -> False

cvtVerticalCommand :: (String, String) -> Int
cvtVerticalCommand cmd = case fst cmd of
  "up" -> -1 * (readInt (snd cmd))
  "down" -> 1 * (readInt (snd cmd))
  _ -> 0 

cvtHorizontalCommand :: (String, String) -> Int
cvtHorizontalCommand cmd = case fst cmd of
  "forward" -> 1 * (readInt (snd cmd))
  _ -> 0 
