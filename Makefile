all: SATSolver

SATSolver: SATSolver.hs Parser.hs DataTypes.hs
	ghc SATSolver.hs

clean:
	$(RM) *.hi *.o

clean-bin:
	$(RM) SATSolver
