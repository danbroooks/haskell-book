module Ch15 where

import Control.Monad
import Data.Monoid

data Optional a =
  Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  mappend a Nada = a
  mappend Nada a = a
  mappend (Only a) (Only b) = Only $ a `mappend` b

--

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' e adv noun adj =
  e <> "! he said " <>
  adv <> " as he jumped into his car " <>
  noun <> " and drove off with his " <>
  adj <> " wife."

madlibbinBetter' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbinBetter' e adv noun adj =
  mconcat [
    e, "! he said ",
    adv, " as he jumped into his car ",
    noun, " and drove off with his ",
    adj, " wife."
  ]

--

newtype First' a =
  First' { getFirst' :: Optional a }
  deriving (Eq, Show)

instance Monoid (First' a) where
  mempty = First' Nada
  mappend (First' Nada) x = x
  mappend x _ = x

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend = First' String -> First' String -> First' String -> Bool

