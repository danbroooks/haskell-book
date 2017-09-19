module Ch15.Semigroup where

import Data.Semigroup

data Trivial = Trivial deriving (Eq, Show)

newtype Identity a = Identity a deriving (Eq, Show)

data Two a b = Two a b deriving (Eq, Show)

data Three a b c = Three a b c deriving (Eq, Show)

data Four a b c d = Four a b c d deriving (Eq, Show)

newtype BoolConj = BoolConj Bool deriving (Eq, Show)

newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Semigroup a => Semigroup (Identity a) where
  (Identity a) <> (Identity b) = Identity (a <> b)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  (Two a b) <> (Two c d) = Two (a <> c) (b <> d)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
  (Three a b c) <> (Three d e f) = Three (a <> d) (b <> e) (c <> f)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where
  (Four a b c d) <> (Four e f g h) = Four (a <> e) (b <> f) (c <> g) (d <> h)

instance Semigroup BoolConj where
  BoolConj True <> BoolConj True = BoolConj True
  _ <> _ = BoolConj False

instance Semigroup BoolDisj where
  BoolDisj True <> _ = BoolDisj True
  _ <> BoolDisj True = BoolDisj True
  _ <> _ = BoolDisj False

