import System.Environment
import DataTypes
import Parser

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  symbols <- getSymbols clauses
  putStrLn "Clauses:"
  print clauses
  putStrLn "Symbols:"
  print symbols

