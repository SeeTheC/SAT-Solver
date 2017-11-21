-- DPLL (Davis-Putnam-Logemann-Loveland) Algo
module DPLLSolver where
import DataTypes
import CommonFunLib
import Parser

dpllSolver::Clauses->Symbols->SatResult
dpllSolver clauses  symbols = dpllSolver' clauses state
                              where state=(initState symbols)

dpllSolver'::Clauses->State->SatResult
dpllSolver' clauses state
                       | clauses == [] = convertToSatResult T state
                       | ([] `elem` clauses)  = convertToSatResult F state
                       -- Checking for unit clause
                       | (length uc) /= 0  && validUC =  dpllSolver' (simplify clauses uc) (updateStateByLiteral state uc)
                       | otherwise = if (fst trueSymSolver) == Satisfiable
                                     then trueSymSolver
                                     else falseSymSolver
                       where
                       uc = unitClause clauses
                       --uc = [(P,"114"),(N,"114")] this is invalid as both complement exist
                       validUC= and [ (notLiteral l) `notElem` uc | l<-uc]
                       sym= head $ getSymbols clauses
                       trueSymSolver = dpllSolver' (simplify clauses [(P,sym)] )  (updateStateByLiteral state [(P,sym)])
                       falseSymSolver= dpllSolver' (simplify clauses [(N,sym)] )  (updateStateByLiteral state [(N,sym)])

-- Finds the unit clause from the Formula and return all unit clause
unitClause:: Clauses->Clause
unitClause clauses = [ head c  | c<-clauses,length c == 1]

-- Simpliys the Equation by removing the Literal for which value is being set
simplify:: Clauses->Clause->Clauses
simplify clauses literals = removedLiteral
                            where
                            removedClause  = [ c | c<-clauses, foldr (\l o-> (l `notElem` c ) && o ) True literals ]
                            removedLiteral = [ (filter (\cl-> not $ or (map (\l-> cl== notLiteral l) literals)  ) c)  | c<-removedClause]

-- update the state w.r.t passed literal list
updateStateByLiteral:: State->Clause->State
updateStateByLiteral state [] = state
updateStateByLiteral state ((sign,sym):ls) = updateStateByLiteral us ls
                                             where
                                             us= if (sign == P ) then updateState state (sym,T) else updateState state (sym,F)

dSolver clauses = do
                  putStr "\nResult:"
                  print status
                  putStr "\nVerify Computed Result:"
                  print (eval clauses state)
                  return assignment
                  where
                  symbols= (getSymbols clauses)
                  (status, state)=dpllSolver clauses symbols
                  assignment = [ (sym, state (P,sym))  | sym<-symbols ]
