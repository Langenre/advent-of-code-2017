solve xxs = sum $ map (\xs -> maximum xs - minimum xs) xxs

main :: IO()
main = do
  input <- map (map read . words) . lines <$> readFile "input.txt"
  print $ solve input