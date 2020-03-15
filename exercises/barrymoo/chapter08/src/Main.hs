module Main where

import Data.Bifunctor
import Data.Functor.Identity (Identity (..))
import Control.Applicative (Const (..))

-- 1.
data Pair a b = Pair a b

instance Bifunctor Pair where
  bimap f g (Pair x y) = Pair (f x) (g y)
  -- first f (Pair x y) = Pair (f x) y
  -- second g (Pair x y) = Pair x (g y)

-- 2.
type Maybe' a = Either (Const () a) (Identity a)
iso :: Maybe a -> Maybe' a
iso Nothing = Left . Const $ ()
iso (Just x) = Right . Identity $ x

-- 3.
data PreList a b = Nil | Cons a b

instance Bifunctor PreList where
  bimap _ _ Nil = Nil
  bimap f g (Cons x y) = Cons (f x) (g y)

-- 4.

newtype K2 c a b = K2 c
newtype Fst a b = Fst a
newtype Snd a b = Snd b

instance Bifunctor (K2 c) where
  bimap _ _ (K2 x) = K2 x

instance Bifunctor Fst where
  bimap f _ (Fst x) = Fst $ f x

instance Bifunctor Snd where
  bimap _ f (Snd x) = Snd $ f x

main :: IO ()
main = putStrLn "Chapter 8"
