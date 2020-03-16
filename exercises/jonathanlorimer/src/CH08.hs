-- | 1.
data Pair a b = Pair a b

instance Bifunctor Pair where
  bimap g f (Pair a b) = Pair (g a) (f b)
  first g (Pair a b) = Pair (g a) b
  second f (Pair a b) = Pair a (f b)

-- | 2.
type Maybe' a = Either (Const () a) (Identity a)

iso :: Maybe a -> Maybe' a
iso Nothing = Left $ Const ()
iso Just a = Right $ Identity a

iso' :: Maybe' a -> Maybe a
iso (Left _) = Nothing
iso (Right (Identity a)) = Just a

-- | 3.
data PreList a b = Nil | Cons a b

instance Bifunctor PreList where
  bimap _ _ Nil = Nil
  bimap f g (Cons a b) = Cons (f a) (g b)

-- | 4.
data K2 c a b = K2 c

instance Bifunctor (K2 c) where
  bimap _ _ k2 = k2

data Fst a b = Fst a

instance Bifunctor Fst where
  bimap f _ (Fst a) = Fst $ f a

data Snd a b = Snd b

instance Bifunctor Snd where
  bimap _ g (Snd b) = Snd $ g b

-- | 5.


