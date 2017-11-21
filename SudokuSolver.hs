--module SudokuAssignmentParser where
import System.Environment
import DataTypes
import Parser
import DPLLSolver

sudokuAssignmentParser [] = [[0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0]]
sudokuAssignmentParser (((row:column:value:empty),boolean):xs) | boolean == T = replace result (read [row]::Int) (read [column]::Int) (read [value]::Int)
                                                               | otherwise = sudokuAssignmentParser xs
  where result = sudokuAssignmentParser xs


replace matrix m n value = result
  where (upper, lower) = splitAt (m - 1) matrix
        row = head lower
        (left, right) = splitAt (n - 1) row
        column = left ++ [value] ++ tail(right)
        result = upper ++ [column] ++ tail(lower)

main = do
  (filename:_) <- getArgs
  clauses <- parse filename
  constraints <- parse "sudoku.txt"
  assignments <- dSolver (clauses ++ constraints)
  matrix <- return $ sudokuAssignmentParser assignments
  putStrLn "\nSudoku:"
  tmp <- mapM print matrix
  putStr "\n"
