module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"


data Optional a = Absent | Present a

oident :: a -> Optional a
oident = Present

safeRecip :: Fractional a => Eq a => a -> Optional a
safeRecip a =
  if (a == 0) then Absent
  else (Present $ 1/a)

safeSqrt :: Floating a => Ord a => a -> Optional a
safeSqrt a =
  if a >= 0 then Present (sqrt a)
  else Absent

safeRootReciprocal :: Floating a => Ord a => a -> Optional a
safeRootReciprocal = safeRecip `ocomp` safeSqrt

ocomp :: (a -> Optional b) -> (b -> Optional c) -> (a -> Optional c)
ocomp (amb) (bmc) =
  composed
  where
    composed x =
      case amb x of
        Present b ->
          bmc b
        Absent ->
          Absent
