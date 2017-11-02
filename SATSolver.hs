import System.Environment

type Clause = [Int]
type Symbol = Int

-- Takes FilePath
-- Returns [Clause]
parse filename = do
  content <- readFile filename
  let
    conjuctions = lines content
    listOfStrings = map words conjuctions
    listOfClauses = map (map read) listOfStrings :: [Clause]
  return listOfClauses

-- Merges list of lists into a single list
mergeLists [] = []
mergeLists (x:xs) = x ++ mergeLists xs

-- Converts a negative number to positive
removeNegatives [] = []
removeNegatives (x:xs) | x < 0 = (-1 * x) : removeNegatives xs
                       | otherwise = x : removeNegatives xs

-- Removes duplicate elements from a list
unique [] = []
unique (x:xs) = x : unique (filter (x /=) xs)

-- Takes [Clause]
-- Returns [Symbols]
getSymbols clauses = do
  let
    symbols = unique $ removeNegatives $ mergeLists clauses :: [Symbol]
  return symbols

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  symbols <- getSymbols clauses
  putStrLn "Clauses:"
  print clauses
  putStrLn "Symbols:"
  print symbols
