all: SATSolver SATSolverBruteForce SudokuSolver

SATSolver: SATSolver.hs Parser.hs DataTypes.hs CommonFunLib.hs BruteforceSolver.hs DPLLSolver.hs
	ghc SATSolver.hs

SATSolverBruteForce: SATSolverBruteForce.hs Parser.hs DataTypes.hs CommonFunLib.hs BruteforceSolver.hs
	ghc SATSolverBruteForce.hs

SudokuSolver: SudokuSolver.hs Parser.hs DataTypes.hs CommonFunLib.hs DPLLSolver.hs
	ghc SudokuSolver

clean:
	$(RM) *.hi *.o *~

clean-bin:
	$(RM) SATSolver SATSolverBruteForce SudokuSolver
