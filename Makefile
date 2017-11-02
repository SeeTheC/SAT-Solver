all: SATSolver

SATSolver: SATSolver.hs
	ghc SATSolver.hs

clean:
	$(RM) *.hi *.o

clean-bin:
	$(RM) SATSolver
