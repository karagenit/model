# model

Ruby Gem to Define Mathematical Relationships Between Variables and Solve Given Certain Data

Equation obj: stores relationship between output var (symbol), input var(s) (symbol), and function used (lambda)

System obj: series of Equations, when given values for inputs tries to calculate values for all unknown vars, returns:

Result obj: hash of vars and their values or nil if it couldn't be computed
