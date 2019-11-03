import qualified Data.Sequence as S

solve :: Int -> Int -> S.Seq Int -> Int
solve index count xs =
  if index >= S.length xs
  then count
  else solve
    ((+) index $ S.index xs index)
    ((+) count 1)
    (S.update index ((+) 1 $ S.index xs index) xs)

main :: IO()
main = do
  input <- lines <$> readFile "input.txt"
  let instructions = S.fromList $ map (read :: String -> Int) input
  print $ solve 0 0 instructions