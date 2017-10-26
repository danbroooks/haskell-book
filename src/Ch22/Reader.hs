{-# LANGUAGE InstanceSigs #-}

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

liftA2 :: Applicative f =>
     (a -> b -> c)
  -> f a -> f b -> f c
liftA2 f a b = f <$> a <*> b

asks :: (r -> a) -> Reader r a
asks f = Reader f

instance Functor (Reader r) where
  fmap :: (a -> b) -> Reader r a -> Reader r b
  fmap f (Reader ra) =
    Reader $ (f . ra)

instance Applicative (Reader r) where
  pure :: a -> Reader r a
  pure a = Reader $ (\r -> a)

  (<*>) :: Reader r (a -> b)
        -> Reader r a
        -> Reader r b
  (Reader rab) <*> (Reader ra) =
    Reader $ (rab <*> ra)

data Dog =
  Dog { dogName :: String
      , dogHome :: String }

data Person =
  Person { personName :: String
         , personHome :: String
         , dog :: String }

getDogR :: Reader Person Dog
getDogR = Dog <$> Reader dog <*> Reader personHome

