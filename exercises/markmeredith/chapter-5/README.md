1.    Suppose that there are two terminal objects in the category, objects `a` and `b`.
There is exactly one morphism `a->a` because `a` is terminal, so it must be the identity morphism.
There is exactly one morphism `b->b` because `b` is terminal, so it must be the identity morphism.

There is exactly one morphism `a->b` because `b` is terminal.
There is exactly one morphism `b->a` because `a` is terminal.
So composition `(a->b).(b->a)`  must be the identity morphism for `a`.
So composition `(b->a).(a->b) ` must be the identity morphism for `b`.
So `(a->b)` and `(b->a)` must be inverses of each other and `a` and `b` must be isomorphic.

2.    What is a product of two objects in a poset? Hint: Use the universal construction.

The Product of `a` and `b` is an object `c` such that there are morphisms
(projections) `c<=a` and `c<=b` such that for any other `c'` such that `c'<=a`
and `c'<=b` there is a unique morphism `c'<=c` that factorizes `c<=a` and `c<=b`.

In other words, `c` is the greatest lowest bound of `a` and `b`.

3.    What is a coproduct of two objects in a poset?

The Coproduct of `a` and `b` is an object `c` such that there are morphisms
(injections) `a<=c` and `b<=c` such that for any other `c'` such that `a<=c'`
and `b<=c'` there is a unique morphism `c<=c'` that factorizes `a<=c` and `b<=c`.

In other words, `c` is the least upper bound of `a` and `b`.

4.    Implement the equivalent of Haskell Either as a generic type in your favorite language (other than Haskell).

See `src/challenge_4.rs`

5.    Show that Either is a “better” coproduct than int equipped with two injections...

See `src/challenge_5.rs`

6.    Continuing the previous problem: How would you argue that int with the two injections i and j cannot be “better” than Either?

See `src/challenge_6.rs`


for the given `m(Either<i16, bool>) -> i16` and `i_prime`,`j_prime` functions, therefore `Either<i16,bool>` is better by definition.


7.   Still continuing: What about these injections?
See `src/challenge_7.rs`

8.    Come up with an inferior candidate for a coproduct of int and bool that cannot be better than Either because it allows multiple acceptable morphisms from it to Either.

See `src/challenge_8.rs`
