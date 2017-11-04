all: SATSolver SATSolverBruteForce

SATSolver: SATSolver.hs Parser.hs DataTypes.hs CommonFunLib.hs BruteforceSolver.hs DPLLSolver.hs
	ghc SATSolver.hs

SATSolverBruteForce: SATSolverBruteForce.hs Parser.hs DataTypes.hs CommonFunLib.hs BruteforceSolver.hs
	ghc SATSolverBruteForce.hs

clean:
	$(RM) *.hi *.o

clean-bin:
	$(RM) SATSolver
