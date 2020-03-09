

1. show the isomorphism...

```
m2e :: Maybe a -> Either () a
m2e (Just a) = Right a
m2e Nothing = Left ()

e2m :: Either () a -> Maybe a
e2m (Left ()) = Nothing
e2m (Right a) = Just a
```

2. (skipping, too simple)

3. I would have had to add functions to
both Circle and Rect classes.

4. In haskell, besides adding Square to the definition of Shape,
I would have had to add clasues relvant to Square for each function.

In Java, you could (just) implement a separate class for Square,
and make all the changes there.

5. a + a = 2 * a

a + a => Either a a

2 * a => (bool, a)


Is showing isomorphism enough?

```
f :: Either a a -> (Bool, a)
f (Left a) = (True, a)
f (Right a) = (False, a)

g :: (Bool, a) -> Either a a
g (True, a) = Left a
g (False, a) =  Right a
```
