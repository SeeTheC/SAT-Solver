import System.Environment
import DataTypes
import Parser
import BruteforceSolver

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  symbols <- pure (getSymbols clauses)
  putStrLn "Clauses:"
  print clauses
  putStrLn "Symbols:"
  print symbols
  putStrLn "---------------------------------------------"  
  bSolver clauses

