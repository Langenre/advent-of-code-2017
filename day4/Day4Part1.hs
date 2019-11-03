import Data.List

main :: IO()
main = do
  input <- map words . lines <$> readFile "input.txt"
  print $ length $ filter (\a -> nub a == a) input