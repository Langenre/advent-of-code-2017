import Data.Char

solve n xs = sum $ zipWith (\a b -> if a == b then a else 0) xs (drop n $ cycle xs)

main :: IO()
main = do
  file <- readFile "input.txt"
  let input = map digitToInt file
  -- Solution 1
  print $ solve 1 input
  -- Solution 2
  print $ solve (length input `div` 2) input