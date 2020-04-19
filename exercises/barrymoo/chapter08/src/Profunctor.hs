module Profunctor where

import           Control.Applicative            ( liftA2 )
import           Data.Bifunctor                 ( bimap )

mapInput :: (input -> out) -> (newInput -> input) -> (newInput -> out)
mapInput = (.)

class Profunctor p where
  {-# MINIMAL dimap | lmap, rmap #-}
  dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
  dimap ab cd = rmap cd . lmap ab
  lmap :: (a -> b) -> p b c -> p a c
  lmap ab = dimap ab id
  rmap :: (b -> c) -> p a b -> p a c
  rmap = dimap id

instance Profunctor (->) where
  -- p ~ (->)
  -- pbc :: (b -> c)
  -- f :: (a -> b)
  -- g :: (c -> d)
  dimap f g pbc = g . pbc . f

  -- p ~ (->)
  -- pbc :: (b -> c)
  -- f :: (a -> b)
  lmap f pbc = pbc . f

  -- p ~ (->)
  -- pab :: (a -> b)
  -- f :: (b -> c)
  rmap f pab = f . pab

data Sum f g a b = L (f a b) | R (g a b)

instance (Profunctor f, Profunctor g) => Profunctor (Sum f g) where
  dimap ab cd (L fxy) = L $ dimap ab cd fxy
  dimap ab cd (R gxy) = R $ dimap ab cd gxy

newtype Product f g a b = Product (f a b, g a b)

instance (Profunctor f, Profunctor g) => Profunctor (Product f g) where
  dimap ab cd (Product t) = Product $ bimap (dimap ab cd) (dimap ab cd) t
