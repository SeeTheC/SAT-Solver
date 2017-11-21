module DataTypes where
import Data.List

-- P: Positive N: Negative/Complement
data Sign = P | N deriving (Show,Eq)
--T: True, F: False, ND: Not define
data Boolean = T | F | ND deriving (Show,Eq,Read)
-- Where solution to SAT Formula exists or not
data Satisfiability = Satisfiable | NotSatisfiable deriving (Show,Eq)

type Symbol = [Char]
type Symbols = [Symbol]
type SymbolVal = (String,Boolean)
type SymbolsVal = [SymbolVal]

type Literal = (Sign, Symbol)
type Clause = [Literal]
type Clauses = [Clause]
type State =Literal->Boolean
type SatResult = (Satisfiability, State)

-- Convert T to F and ViseVersa
complement::Boolean->Boolean
complement b | b == ND = ND
             | b == T = F
             | b == F = T

-- complement the value when sign is N
signComplement::Sign->Boolean->Boolean
signComplement sign val = if (sign==N) then (complement val) else val

-- Complement the Literal Sign
notLiteral::Literal->Literal
notLiteral (sign,sym) | sign == N = (P,sym)
                      | sign == P = (N,sym)

-- Sort SymbolVal
sortSymbolVal:: [SymbolVal] -> [SymbolVal]
sortSymbolVal symList = sortBy symbolValComparitor symList
                    where symbolValComparitor (sym1,_) (sym2,_)= if (sym1 ==sym2) then EQ
                                                                 else if (sym1 < sym2) then LT
                                                                 else GT
