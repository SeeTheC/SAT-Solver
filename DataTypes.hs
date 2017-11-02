module DataTypes where

type Symbol = [Char]
type Symbols = [Symbol]
type Literal = (Sign, Symbol)
data Sign = P | N deriving (Show)

type Clause = [Literal]
type Clauses = [Clause]
