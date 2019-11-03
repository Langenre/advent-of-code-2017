import Data.List

main :: IO()
main = do
  input <- map words . lines <$> readFile "input.txt"
  print $ length $ filter (\xs -> nub xs == xs) (map (map sort) input)