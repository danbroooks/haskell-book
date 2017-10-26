module Ch22.Reader where

import Data.Char

cap :: [Char] -> [Char]
cap = map toUpper

rev :: [Char] -> [Char]
rev = reverse

composed :: [Char] -> [Char]
composed = cap . rev

fmapped :: [Char] -> [Char]
fmapped = fmap cap rev

tupled :: [Char] -> ([Char], [Char])
tupled = (,) <$> cap <*> rev

explicitlyTupled :: [Char] -> ([Char], [Char])
explicitlyTupled str = (cap str, rev str)

monadicallyTupled :: [Char] -> ([Char], [Char])
monadicallyTupled = fmap rev <$> (cap >>= (,))

doBlockTupled :: [Char] -> ([Char], [Char])
doBlockTupled = do
  cp <- cap
  rv <- rev
  return (rv, cp)

newtype Reader r a =
  Reader { runReader :: r -> a }

ask :: Reader a a
ask = Reader id

