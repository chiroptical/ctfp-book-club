(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 7.

;;; 1. Can we turn the Maybe type into a functor by defining
;;;    (fmap _ _) => Nothing?
;;;
;;;    Yes, this becomes a Unit Functor.  In particular:
;;;    - Objects all map to nothing.
;;;    - Every morphism maps to id_nothing.
;;;    - Composition works just as it does for any Unit Functor.

;;; 2. Prove functor laws for the reader functor.
;;;
;;;    - Any object a maps to r -> a.
;;;    - Any function f a -> b maps to r -> a -> b by simply composing
;;;      r-> with f.
;;;    - Similarly composition of f and g works by composing r-> before f and g.

;;; 3. Implement the reader functor in your favorite langauge.
(deftype reader (type1 type2)
  `(ftype (function (type1) ,type1) ,type2))

;;; 4. Prove the functor laws for the list functor.
;;;
;;;    Forall f: a -> b, List(f) List(a) -> List(b).
;;;      fmap f []: []
;;;      fmap f [x:xs]: f(x) : fmap f [xs]
;;;
;;;    List(f) = (fmap f) and in both cases (fmap f) has type List(a)
;;;    -> List(b).
