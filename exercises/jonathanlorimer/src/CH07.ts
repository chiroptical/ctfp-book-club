// 1.
/*
No we cannot, because then the functor laws will be violated
i.e.
-> fmap id == id
-> fmap id (Just 1) /= id (Just 1)
*/

// 2.
/*
f :: a -> b
id :: b -> b
-> fmap id == id        (functor law)
-> fmap id f == id f    (substitute in reader functor)
-> id . f == id f       (definition of fmap for reader)
-> id . f == f          (id laws)
-> id f == f            (id laws)
---
-> id . f == f == id f
*/

// 3.
// NOTE: this highlights the downside of not having higher kinded types
// i.e. we have to define up front what kind of Reader instance we have,
// that is to say we cannot define an fmap instance for all A's

// NOTE2: There is a way to get around this limitation by simulating
// HKT's in a language that only supports generics. There is an implementation
// for this in typescript in Giulio Canti's library fp-ts
// https://github.com/gcanti/fp-ts/blob/master/src/HKT.ts

interface Reader<R, A> {
  reader: (r: R) => A
  fmap: <B>(f: (a: A) => B) => (r: R) => B
}

const mkReader = <R, A>(reader: (r: R) => A): Reader<R, A> => ({
  reader,
  fmap: <B>(f: (a: A) => B) => (r: R) => f(this.reader(r))
})

// 4.
/*
-> fmap id == id                        (functor law)
-> id x : fmap id xs == id (x:xs)       (fmap for lists)
-> x : fmap id xs == x : xs             (by definition of id)
-> x : (id xs) == x : xs                (inductively applying the functor law)
-> x : xs == x : xs

-> fmap (f . g)                                == fmap f . fmap g               (functor law)
-> fmap (\x -> f (g x))                        == \xs -> fmap f (fmap g xs)     (lambda substitution)
-> (\x -> f (g x)) y : fmap (\x -> f (g x)) ys == fmap f (g y : fmap g ys)      (list substitution)
-> f (g y) : fmap (\x -> f (g x)) ys           == f (g y) : fmap f (fmap g ys)  (lambda unsubstitution)
-> f (g y) == f (g y)                                                           (equality reduction for first case)
-> fmap f . g == fmap f . fmap g                                                (equality by induction)

*/

