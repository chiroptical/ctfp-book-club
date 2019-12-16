1. 1. The single node is the object, and the "chain of edges of zero length" is
   the only morphism.

   2. The category consists of the single object (nodee), and the morphisms are
   chains of the edge composed with itself zero or more times; equivalent to the
   monoid of addition of natural numbers.

   3. The objects are the two nodes, and there are 3 morphisms: chain of zero
   edges on the first object, chain of zero edges on the first object, and the
   edge between the objects.

   4. The object is the single node, and the morphisms are the sequences of all distinct
   26 arrows. This is equivalent to all (lowercase) alphabetic strings.


2. 1. Sets under inclusion relationship is a partial order, because
      A ⊆ B and B ⊆ A ⇒ A = B.

   2. A function taking a pointer to T1 can take a pointer to T1, so each type (T1) is a subtype of itself.
   If T1 is a subtype of T2 and T2 is a subtype of T3, then a function taking *T3 can take a pointer to *T2 so it can take a pointer to *T1. This is associative.*
   Therefore the relation is a preorder.
   I think it is a partial order, but I don't know C++ well enough to prove it.

3. Using 1 and 0 instead True and False (for brevity).
   For &&:
   ```
   1 && 0 == 0 && 1 == 0
   1 && 1 == 1 && 1 == 1
   So 1 is an identity for &&.
   0 && (0 && 0) == (0 && 0) && 0 == 0
   0 && (0 && 1) == (0 && 0) && 1 == 0
   0 && (1 && 0) == (0 && 1) && 0 == 0
   0 && (1 && 1) == (0 && 1) && 1 == 0
   1 && (0 && 0) == (1 && 0) && 0 == 0
   1 && (0 && 1) == (1 && 0) && 1 == 0
   1 && (1 && 0) == (1 && 1) && 0 == 0
   1 && (1 && 1) == (1 && 1) && 1 == 1
   ```
   So && is associative.

   For ||:
   ```
   0 || 0 == 0 || 0 == 0
   0 || 1 == 1 || 0 == 1
   So 0 is an identity for ||.
   0 || (0 || 0) == (0 || 0) || 0 == 0
   0 || (0 || 1) == (0 || 0) || 1 == 1
   0 || (1 || 0) == (0 || 1) || 0 == 1
   0 || (1 || 1) == (0 || 1) || 1 == 1
   1 || (0 || 0) == (1 || 0) || 0 == 1
   1 || (0 || 1) == (1 || 0) || 1 == 1
   1 || (1 || 0) == (1 || 1) || 0 == 1
   1 || (1 || 1) == (1 || 1) || 1 == 1
   ```
   So || is associative.

  4. The objects are 0 and 1, the morphisms are:
       ```
       1->1 (i.e. "&& 1")
       0->0 (i.e. "&& 0" or "&& 1")
       1->0 (i.e. "&& 0")
       ```
       - There is an identity morphism for both elements.
       - && is associative, so morphism composition is associative.
       - Bool is a category.

5. The objects are {0, 1, 2} and the morphisms are:
   ```
   0->0 (+0)
   1->1 (+0)
   2->2 (+0)
   0->1 (+1)
   1->2 (+1)
   2->0 (+1)
   0->2 (+2)
   1->0 (+2)
   2->1 (+2)
   ```
   - There is an identity morphism for each element.
   - Addition is associative, so morphism composition is associative.
   - Addition mod 3 is a category.
