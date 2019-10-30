{-# LANGUAGE GADTs #-}

module Main where

import Control.Monad.State
import Debug.Trace
import Criterion.Main
import Data.Maybe

runFib :: IO ()
runFib = do
  -- defaultMain
  --   [ bench "memoized" (whnf (\x->fst $ runState (fib' x) []) 10)
  --   , bench "non-memoized" (whnf fib 10)]

  let initial = []
  putStrLn $ show $ fst $ runState (fib'' (10 :: Integer)) []


fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fib' :: Integer -> State [(Integer,Integer)] Integer
fib' 0 = return 1
fib' 1 = return 1
fib' x = do
  result <- lookup x <$> get

  case result of
    Nothing -> do
      new1 <- fib' (x - 1)
      new2 <- fib' (x - 2)
      let res = new1 + new2
      memory <- get
      let memory' = (x, res) : memory
      put memory'
      return res

    Just res ->
      return res

lookupOrCalc' :: Eq a => a -> (a -> State [(a, b)] b) -> State [(a, b)] b
lookupOrCalc' x calc = do
  result <- lookup x <$> get
  case result of
    Nothing -> do
      res <- calc x
      memory <- get
      let memory' = (x, res) : memory
      put memory'
      return res
    Just res ->
      return res

fib'' :: Integer -> State [(Integer, Integer)] Integer
fib'' 0 = return 1
fib'' 1 = return 1
fib'' x = do
  l1 <- lookupOrCalc' (x - 1) fib''
  l2 <- lookupOrCalc' (x - 2) fib''
  return $ l1 + l2




memo :: Eq a => (a -> b) -> a -> State [(a,b)] b
memo f = do
  let memoer x = do
        result <- lookup x <$> get

        case result of
          Nothing -> do

            new1 <- memoer (x - 1)
            new2 <- fib' (x - 2)
            let res = new1 + new2
            memory <- get
            let memory' = (x, res) : memory
            put memory'
            return res

          Just res ->
            return res
  undefined

test = do
  runFib
  main

main :: IO ()
main = do
  putStrLn "fin main."
