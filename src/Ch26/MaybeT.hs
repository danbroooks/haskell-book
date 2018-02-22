module Ch26.MaybeT where

newtype MaybeT m a =
  MaybeT { runMaybeT :: m (Maybe a) }

instance (Functor m) => Functor (MaybeT m) where
  fmap f (MaybeT ma) = MaybeT $ (fmap . fmap) f ma

instance

instance (Applicative m) => Applicative (MaybeT m) where
  pure x =
  MaybeT fab <*> MaybeT mma =

