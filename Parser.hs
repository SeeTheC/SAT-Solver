module Parser where
import DataTypes

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

-- Converts negative numbers in a list to positive numbers
removeNegatives [] = []
removeNegatives (x:xs) | x < 0 = (-1 * x) : removeNegatives xs
                       | otherwise = x : removeNegatives xs

-- Removes duplicate elements from a list
unique [] = []
unique (x:xs) = x : unique (filter (x /=) xs)

-- Takes [Clause]
-- Returns [Symbol]
getSymbols clauses = do
  let
    symbols = unique $ removeNegatives $ mergeLists clauses :: [Symbol]
  return symbols
