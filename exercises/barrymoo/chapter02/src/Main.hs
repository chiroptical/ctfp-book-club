{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import Control.Monad.Trans.State
import           Control.Monad.IO.Class         ( liftIO )
import qualified Data.Map as M
import System.Random

--------
-- 1. --
memoize :: Ord a => (a -> b) -> a -> StateT (M.Map a b) IO b
memoize f a = do
  m <- get
  case M.lookup a m of
    Just y -> return y
    Nothing -> do
      let y = f a
      put $ M.insert a y m
      return y
--------

--------
-- 3. --
memoizeRandom :: forall b. Random b => Int -> StateT (M.Map Int b) IO b
memoizeRandom x = do
  m <- get
  case M.lookup x m of
    Just y -> return y
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

main :: IO ()
main = do
  let plusOne = memoize (+1)
  m <- execStateT (plusOne 1) M.empty
  y <- evalStateT (plusOne 1) m
  print y
