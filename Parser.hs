module Parser where
import DataTypes

-- Takes [String]
-- Returns [Literal]
stringToLiteral [] = []
stringToLiteral (x:xs) | (head x) == '-' = (N, tail x) : stringToLiteral xs
                       | otherwise = (P, x) : stringToLiteral xs

-- Takes FilePath
-- Returns Clauses
parse filename = do
  content <- readFile filename
  let
    conjuctions = lines content
    listOfStrings = map words conjuctions
    clauses = map stringToLiteral listOfStrings :: Clauses
  return clauses

-- Merges list of lists into a single list
mergeLists [] = []
mergeLists (x:xs) = x ++ mergeLists xs

-- Removes the first element from the Literal tuple
removeSign [] = []
removeSign ((sign, symbol):xs) = symbol : removeSign xs

-- Removes duplicate elements from a list
unique [] = []
unique (x:xs) = x : unique (filter (x /=) xs)

-- Takes Clauses
-- Returns Symbols
getSymbols clauses = unique $ removeSign $ mergeLists clauses :: Symbols
