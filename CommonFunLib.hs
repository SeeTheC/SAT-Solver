module CommonFunLib where
import DataTypes

clause1=[[(P,"1"),(P,"2"),(P,"3"),(N,"4")],[(P,"2"),(N,"3"),(P,"5")],[(P,"4"),(N,"1"),(N,"3")]]
symbol1=["1","2","3","4","5"]
state1 = initState symbol1

clause2=[[(N,"2")],[(P,"4")],[(P,"1"),(P,"2"),(P,"3"),(N,"4")],[(P,"2"),(N,"3"),(P,"5")],[(P,"4"),(N,"1"),(N,"3")]]
symbol2=["1","2","3","4","5"]
state2 = initState symbol2

-- Init all Symbols/Varibale to ND (not define)
initState:: Symbols->State
initState symbols=  (findLiteralVal symbolList)
                    where
                    symbolList=[ (s,ND)  | s<-symbols]


-- Given the Literal will find its value
findLiteralVal:: SymbolsVal->Literal->Boolean
findLiteralVal symbolList (sign,sym)  = [ signComplement sign val | (s,val)<-symbolList, sym==s ] !!0

-- Convert Symbol Assignment to State
convertAssignToState:: SymbolsVal->Literal->Boolean
convertAssignToState assign= findLiteralVal assign

updateState::State->SymbolVal->State
updateState state (sym,val)= (\literal@(sign,s)-> if (s==sym ) then (signComplement sign  val) else (state literal) )

-- Given a set of clauses in CNF and a state, will evalute the expression
eval::Clauses->State->Boolean
eval clauses state = if (F `elem` result) then F else (if (ND `elem` result) then ND else T)  
                     where result=[ (subEval sc state)  | sc<-clauses]

-- Given one clause and a state, will evalute the expression
subEval::Clause->State->Boolean
subEval clause state = if (length trueLiteral) > 0 then T else (if (length ndLiteral) > 0 then ND else F)
                       where 
                       trueLiteral=[ literal  | literal<-clause, (state literal) == T]
                       ndLiteral=[ literal  | literal<-clause, (state literal) == ND]

-- Given a set of clauses in CNF and a state, will evalute the expression and covert result into
-- SatResult format
evalSat::Clauses->State->SatResult
evalSat clauses state = if result == T then (Satisfiable,state)
                        else (NotSatisfiable,state)
                        where result= eval clauses state

convertToSatResult::Boolean->State->SatResult
convertToSatResult result state =if result == T then (Satisfiable,state) 
                                 else (NotSatisfiable,state)