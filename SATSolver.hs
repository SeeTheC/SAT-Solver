import System.Environment

-- Returns a list of lists
-- Each list is a clause
parse filename = do
  content <- readFile filename
  let
    conjuctions = lines content
    parsedConjuctions = map (map read) (map words (lines content)) :: [[Int]]
  return parsedConjuctions

main = do
  (filename:_) <- getArgs
  parse filename
