module Ch17.List where

data List a
  = Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Applicative List where
  pure = Cons
  fab <*> fa = do
    f <- fab
    a <- fa
    f a

