module Ch25.IdentityT where

newtype Identity a =
  Identity { runIdentity :: a }

