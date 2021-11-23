module T1 where

-- | We have the following data types
data Quad a = Q a a a a
  deriving Show

data Annotated e a = a :# e
  deriving Show
infix 0 :#

data Prioritised a = Low a | Medium a | High a
  deriving Show

data Stream a = a :> Stream a
  deriving Show
infixr 5 :>

data Tree a = Leaf | Branch (Tree a) a (Tree a)
  deriving Show

-- | T1. Implement Functor instances for these data types
instance Functor Quad where
  fmap = undefined

instance Functor (Annotated e) where
  fmap = undefined

instance Functor Prioritised where
  fmap = undefined

instance Functor Stream where
  fmap f (x :> str) = f x :> fmap f str

instance Functor Tree where
  fmap = undefined

-- You must implement these functions by hand, without using any predefined functions (not even from Prelude) or deriving.

-- | T2. Implement Applicative instances for the same data types
instance Applicative Quad where
  pure  = undefined
  (<*>) = undefined

instance Monoid e => Applicative (Annotated e) where
  pure  = undefined
  (<*>) = undefined

instance Applicative Prioritised where
  pure  = undefined
  (<*>) = undefined

instance Applicative Stream where
  pure  = undefined
  (<*>) = undefined

instance Applicative Tree where
  pure  = undefined
  (<*>) = undefined

-- | T3. Implement Monad instances for the same data types except for Tree and Stream:
instance Monad Quad where
  (>>=) = undefined

instance Monoid e => Monad (Annotated e) where
  (>>=) = undefined

instance Monad Prioritised where
  (>>=) = undefined
