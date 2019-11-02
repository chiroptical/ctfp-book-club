module Main where

import Criterion.Main
import Data.Maybe

import Data.IORef
import System.IO.Unsafe (unsafePerformIO)


unsafeMemoize :: Eq a => (a -> b) -> a -> b
unsafeMemoize f = unsafePerformIO $ do
  ref <- newIORef []
  return $ \x ->
    unsafePerformIO $ do
      mem <- readIORef ref
      let res = lookup x mem
      case res of
        Nothing -> do
          let y = f x
          writeIORef ref $ (x, y) : mem
          return y
        Just y ->
          return y

memFib :: Int -> Int
memFib =
  unsafeMemoize $ \x ->
    case x of
      0 -> 1
      1 -> 1
      x -> memFib (x - 1) + memFib (x - 2)

fib :: Int -> Int
fib =
  \x ->
    case x of
      0 -> 1
      1 -> 1
      x -> fib (x - 1) + fib (x - 2)

runFib :: IO ()
runFib = do
  let rounds = 15
  defaultMain
    [ bench "memoized" (whnf memFib rounds)
    , bench "non-memoized" (whnf fib rounds)]

test = do
  runFib
  main

main :: IO ()
main = do
  putStrLn "fin main."
