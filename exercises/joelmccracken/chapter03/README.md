
1a. This is a category with a single object and a single edge, identity.

1b. This is a category with a single object, and identity morphism, an `f` morphism, a `f . f` morphism, etc. So there are ininite morphisms.

1c. two nodes A and B, morphisms A->A, A->B, B->B.

1d. one node, but morphisms a..z can be composed with one another; these would form every possible word (sequence of letters), starting with the empty string and continuing on to infinity.

2a. this is partial order, because there If A is in B, and B is in A, then indeed A and B are equal. However, it is not a total order, because it is possible that A or B may not include any of the same elements.

2b. C++ types form a partial order, largely because it cannot be that A inherit from B and B inherit from A at the same time.

3. Operators && and || are both `Bool -> Bool -> Bool`. Thus, no matter how you combine `and` and `or`, your result is Bool, and thus forms a monoid.

4. Morphisms:
- `ta = True  &&` ; `ta True == True ; ta False == False` `(ta = id)`
- `fa = False &&` ; `fa True == False; fa False == False` `(fa = const False) = cf`
- `to = True  ||` ; `to True == True ; to False == True ` `(to = const True) = ct`
- `fo = False ||` ; `fo True == True ; fo False == False` `(fo = id)`

 examining the compositions, we see that they are all already other morphisms, no need to create additional:

- `ta . xx = xx`
- `fa . xx = fa`
- `to . xx = to`
- `fo . xx = xx`

5.
the additions:

0 + 0 = 0
0 + 1 = 1
0 + 2 = 2

1 + 0 = 1
1 + 1 = 2
1 + 2 = 0

2 + 0 = 2
2 + 1 = 0
2 + 2 = 1

Object is Int {0,1,2}

Morphisms are (+0), (+1), (+2)

(or are the morphisms infinite (+0) .. (+n), but the results are only {0..2}?)
