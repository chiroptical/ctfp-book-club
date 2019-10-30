{-# LANGUAGE GADTs #-}

module Main where

import Control.Monad.State
import Debug.Trace
import Criterion.Main

runFib :: IO ()
runFib = do
  defaultMain
    [ bench "memoized" (whnf (\x->fst $ runState (fib' x) []) 10)
    , bench "non-memoized" (whnf fib 10)]

  -- let initial = []
  -- putStrLn $ show $ fst $ runState (fib' (516 :: Integer)) []


fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fib' :: Integer -> State [(Integer,Integer)] Integer
fib' x = do
  result <- lookup x <$> get

  case result of
    Nothing -> do
      if x == 0 then
        return 1
      else if x == 1 then
        return 1
      else do
        new1 <- fib' (x - 1)
        new2 <- fib' (x - 2)
        let res = new1 + new2
        memory <- get
        let memory' = (x, res) : memory
        put memory'
        return res

    Just res ->
      return res

test = do
  runFib
  main

main :: IO ()
main = do
  putStrLn "hello world"
