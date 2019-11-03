solve xxs = sum $ map (\xs -> head [ a `div` b | a <- xs, b <- xs, a `mod` b == 0 && a /= b]) xxs

main :: IO()
main = do
  input <- map (map read . words) . lines <$> readFile "input.txt"
  print $ solve input