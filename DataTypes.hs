module DataTypes where

-- P: Positive N: Negative/Complement
data Sign = P | N deriving (Show,Eq)
--T: True, F: False, ND: Not define
data Boolean = T | F | ND deriving (Show,Eq)

type Symbol = [Char]
type Symbols = [Symbol]
type SymbolVal = (String,Boolean)
type SymbolsVal = [SymbolVal]

type Literal = (Sign, Symbol)
type Clause = [Literal]
type Clauses = [Clause]

type State =Literal->Boolean

-- Convert T to F and ViseVersa
complement::Boolean->Boolean
complement b | b == ND = ND
             | b == T = F
             | b == F = T

-- complement the value when sign is N
signComplement::Sign->Boolean->Boolean
signComplement sign val = if (sign==N) then (complement val) else val



