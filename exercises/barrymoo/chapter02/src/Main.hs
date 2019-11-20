{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import           Control.Monad.Trans.State
import           Control.Monad.IO.Class         ( liftIO )
import qualified Data.Map                      as M
import           System.Random
import           Criterion.Main

--------
-- 1. --
memoize :: Ord a => (a -> b) -> a -> StateT (M.Map a b) IO b
memoize f a = do
  m <- get
  case M.lookup a m of
    Just y  -> return y
    Nothing -> do
      let y = f a
      put $ M.insert a y m
      return y
--------

memoizedFib :: Int -> StateT (M.Map Int Integer) IO Integer
memoizedFib 0 = return 0
memoizedFib 1 = return 1
memoizedFib n = do
  n2 <- getOrUpdate (n - 2) (memoizedFib $ n - 2)
  n1 <- getOrUpdate (n - 1) (memoizedFib $ n - 1)
  return $ n1 + n2

getOrUpdate
  :: Int
  -> StateT (M.Map Int Integer) IO Integer
  -> StateT (M.Map Int Integer) IO Integer
getOrUpdate k currState = do
  mi <- gets (M.lookup k)
  case mi of
    Nothing -> do
      st <- currState
      modify (M.insert k st)
      return st
    Just v -> return v

--------
-- 3. --
memoizeRandom :: forall  b . Random b => Int -> StateT (M.Map Int b) IO b
memoizeRandom x = do
  m <- get
  case M.lookup x m of
    Just y  -> return y
    Nothing -> do
      let std = mkStdGen x
      liftIO $ setStdGen std
      y <- liftIO (randomIO :: IO b)
      put $ M.insert x y m
      return y
--------

--------
-- 5. --
id' :: Bool -> Bool
id' = id

not' :: Bool -> Bool
not' = not

true :: Bool -> Bool
true = const True

false :: Bool -> Bool
false = const False
--------

fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 2) + fib (n - 1)

main :: IO ()
main = defaultMain
  [ bgroup
      "fib"
      [ bench "memoizedFib 35" $ whnf (evalStateT $ memoizedFib 35) M.empty
      , bench "fib 35" $ whnf fib 35
      ]
  ]

-- main :: IO ()
-- main = do
--   print $ fib 35
--   v <- (evalStateT $ memoizedFib 35) M.empty
--   print v
