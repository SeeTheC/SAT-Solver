import System.Environment

type Clause = [Int]
type Symbol = Int

-- Returns a list of Clauses
-- Each list is a clause
parse filename = do
  content <- readFile filename
  let
    conjuctions = lines content
    listOfStrings = map words conjuctions
    listOfClauses = map (map read) listOfStrings :: [Clause]
  return listOfClauses

mergeClauses [] = []
mergeClauses (x:xs) = x ++ mergeClauses xs

removeNegatives [] = []
removeNegatives (x:xs) | x < 0 = (-1 * x) : removeNegatives xs
                       | otherwise = x : removeNegatives xs

unique [] = []
unique (x:xs) = x : unique (filter (x /=) xs)

getSymbols clauses = do
  let
    symbols = unique $ removeNegatives $ mergeClauses clauses :: [Symbol]
  return symbols

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  symbols <- getSymbols clauses
  putStrLn "Clauses:"
  print clauses
  putStrLn "Symbols:"
  print symbols
