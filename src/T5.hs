module T5 where

import T1
import T4

data ExceptState e s a = ES { runES :: s -> Either e (Annotated s a) }

-- This type is a combination of Either and State, allowing a stateful computation to abort with an error.

-- 5.1 Implement the following instances for State:
instance Functor (ExceptState e s) where
  fmap = undefined

instance Applicative (ExceptState e s) where
  pure = undefined
  p <*> q = undefined

instance Monad (ExceptState e s) where
  m >>= f = undefined

-- Hint: implement the function joinState :: State s (State s a) -> State s a
-- for convenience

-- 5.2 Using do-notation for ExceptState, define the evaluation function:
data EvaluationError = DivideByZero

eval :: Expr -> ExceptState EvaluationError [Prim Double] Double
eval = undefined

-- It works just as eval from the previous task but aborts the computation if division by zero occurs:
{-
  runES (eval (2 + 3 * 5 - 7)) []
    ≡
  Right (10 :# [Sub 17 7, Add 2 15, Mul 3 5])
  runES (eval (1 / (10 - 5 * 2))) []
    ≡
  Left DivideByZero
-}
