# SAT-Solver
## Prerequisite 

To run this SAT-Solver, you need haskell compiler. On Ubuntu system install "sudo apt install ghc". Tested on "Ubuntu 16.04" 

## How Run code?
There are 3 algo. Out of three, two are Sat solver and last one is Sudoku solver

1. Open terminal
2. $> make

a) Run DPLL SAT Solver  
$> ./SATSolver <clauese_filename>

b) Run Brute SAT Solver  
$> ./SATSolverBruteForce <clauese_filename>

c) Run Sudoku solver
$> ./SudokuSolver <sudoku_clauese_filename>

## Example:

a) Run DPLL SAT Solver  
$> ./SATSolver cnf2.txt

b) Run Brute SAT Solver  
$> ./SATSolverBruteForce cnf2.txt	

c) Run Sudoku solver
$> ./SudokuSolver sudoku_wiki.txt



