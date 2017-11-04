module BruteforceSolver where
import DataTypes
import CommonFunLib
import Parser

bruteForceSolver::Clauses->Symbols->SatResult 
bruteForceSolver clauses symbols = bruteForceSolver' clauses symbols state 
                                   where state=(initState symbols) 
                           
bruteForceSolver'::Clauses->Symbols->State->SatResult 
bruteForceSolver' clauses symbols state 
                               | symbols == [] = evalSat clauses state
                                -- Checking Satisfibility setting sym to True
                               | trueSymEval == T  = convertToSatResult T (updateState state (sym,T))
                               -- Checking Satisfibility setting sym to False                               
                               | falseSymEval== T  = convertToSatResult T (updateState state (sym,F))
                               -- When less symbols are set for evaluation
                               | otherwise = if (fst trueSymSolver) == Satisfiable
                                             then trueSymSolver
                                             else if (fst falseSymSolver) == Satisfiable
                                             then falseSymSolver
                                             else convertToSatResult F state                               
                               where 
                               sym= head symbols
                               trueSymEval = eval clauses (updateState state (sym,T))
                               falseSymEval= eval clauses (updateState state (sym,F))
                               trueSymSolver=bruteForceSolver' clauses (tail symbols) (updateState state (sym,T))
                               falseSymSolver=bruteForceSolver' clauses (tail symbols) (updateState state (sym,F))



bSolver clauses = do
                  putStr "\nResult:"
                  print status                  
                  putStrLn "\nAssignments:"
                  print assignment
                  where 
                  symbols= (getSymbols clauses)
                  (status, state)=bruteForceSolver clauses symbols
                  assignment= [ (sym, state (P,sym))  | sym<-symbols ]
