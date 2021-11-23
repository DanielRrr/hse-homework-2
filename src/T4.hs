module T4 where

import T1 (Annotated(..))

-- We have the following data type that represents states:
data State s a = S { runS :: s -> Annotated s a }

-- 4.1 Implement the following instances for State:
instance Functor (State s) where
  fmap = undefined

instance Applicative (State s) where
  pure = undefined
  p <*> q = undefined

instance Monad (State s) where
  m >>= f = undefined

-- Hint: implement the function joinState :: State s (State s a) -> State s a
-- for convenience

-- 4.2 We construct a small language using the following types:
data Prim a =
    Add a a      -- (+)
  | Sub a a      -- (-)
  | Mul a a      -- (*)
  | Div a a      -- (/)
  | Abs a        -- abs
  | Sgn a        -- signum

data Expr = Val Double | Op (Prim Expr)

instance Num Expr where
  x + y = Op (Add x y)
  x * y = Op (Mul x y)
  x - y = Op (Sub x y)
  abs x = Op (Abs x)
  signum x = Op (Abs x)
  fromInteger x = Val (fromInteger x)

instance Fractional Expr where
  x / y = Op (Div x y)
  fromRational rat = Val (fromRational rat)

-- Using do-notation for State, define the evaluation function:
eval :: Expr -> State [Prim Double] Double
eval = undefined

-- In addition to the final result of evaluating an expression, it accumulates a trace of all individual operations:
{-
runS (eval (2 + 3 * 5 - 7)) []
  ≡
10 :# [Sub 17 7, Add 2 15, Mul 3 5]
-}
