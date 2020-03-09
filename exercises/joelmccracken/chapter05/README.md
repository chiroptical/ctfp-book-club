# Chapter 05


1. Show that the terminal object is unique up to unique isomorphism.


To answer this, I want to elaborate a bit upon what it would mean for
multiple objects to both be terminal.

For an object to be terminal, it must have a morphism from every other object. So,
if there are multiple terminal objects t1 and t2, there must be morphisms between these objects.

so, lets name these morphisms `f: t1 -> t2` and `g: t2 -> t1`.
The question is, do `t1` and `t2` form an isomorphism between each other, given these
morphisms? That is, does `g . f = id_t1` and `f . g = id_t2`? Well, we know that
those morphisms (`f.g` and `g.f`) must be part of the category. But the only
morphisms these could be are `id_t1` and `id_t2` (no other morphisms exist with
those respective types).

Why can't `f.g` and `g.f` be equivalent to other, hitherto unnamed morphisms? Well,
part of the definition of terminal objects is that there is only one arrow going to
a terminal object from any other object. So, since we know that e.g. `id_t1 : t1 -> t1`
exists, there cannot be another morphism going `t1 -> t1`. So, we know that these
compositions must be the identitiy morphisms.



2. What is a product of two objects in a poset? Hint: Use the universal construction.

The product C of two objects in a poset would be
- the object that is less than both A and B
- the product is also the "closest" of object

So, C would be the object the largest object that is smaller than both A and B.

3. What is a coproduct of two objects in a poset?

Similar to the answer for 2, the coproduct C of two objects A and B in a poset
would be the smallest object which is larger than both A and B.

4. Implement the equivalent of Haskell Either as a generic type in
your favorite language (other than Haskell).

TODO i think i wanna do this in typescript

5. Show that Either is a "better" coproduct than int equipped with two injections...

```
m :: Either Int Bool -> Int
m (Left i)  = i
m (Right b) = if b then 0 else 1
```

6. Continuing the previous problem: how could you argue that `Int` with
two injections `i` and `j` cannot be "better" than `Either`?

Assuming int (`c`) is better than either (`c'`), try to find a
morphism (`m`) from int to either.

A sample `m` would be:

```
m :: Int -> Either Int Bool
m 0 = Right True
m 1 = Right False
m n = Left n
```

So there is an overlap -- there is no way to represent `Left 0`!

7. Still continuing: what about these injections?


Well, this one is a bit trickier, but I think the argument is that
you would not be able to represent the final two numbers in int -- the
number of representable values of `Either int bool` is two more than
`int`.


8. Come up with an inferior candidate...

`(Int, Int)` would be an inferior candidate. Not sure what else is
a better solution

Can use first int as a flag (is the second int an int value or an encoded boolean)
