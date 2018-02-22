module Ch25.Compose where

newtype Compose f g a =
  Compose { getCompose :: f (g a) }
  deriving (Eq, Show)
