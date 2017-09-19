module Tests.Laws.Semigroup where

import Data.Semigroup
import Ch15.Semigroup

associativity :: (Eq m, Semigroup m) => m -> m -> m -> Bool
associativity a b c = (a <> (b <> c)) == ((a <> b) <> c)
