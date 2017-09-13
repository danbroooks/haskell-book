module Ch15 where

data Optional a =
  Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  mappend a Nada = a
  mappend Nada a = a
  mappend (Only a) (Only b) = Only $ a `mappend` b

