import System.Environment
import DataTypes
import Parser
import BruteforceSolver
import DPLLSolver

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  symbols <- pure (getSymbols clauses)
  putStrLn "Clauses:"
  print clauses
  putStrLn "Symbols:"
  print symbols
  putStrLn "---------------------------------------------"
  assignment <- dSolver clauses
  putStrLn "\nAssignments:"
  print assignment
