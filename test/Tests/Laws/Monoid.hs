module Tests.Laws.Monoid where

import Data.Monoid

leftIdentity :: (Eq m, Monoid m) => m -> Bool
leftIdentity a = (mempty <> a) == a

rightIdentity :: (Eq m, Monoid m) => m -> Bool
rightIdentity a = (a <> mempty) == a

associativity :: (Eq m, Monoid m) => m -> m -> m -> Bool
associativity a b c = (a <> (b <> c)) == ((a <> b) <> c)
