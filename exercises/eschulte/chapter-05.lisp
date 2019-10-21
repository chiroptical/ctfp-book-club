(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 5.
(deftype either (left right)
  `(or ,left ,right))

(declaim (ftype (function (integer) integer) i)
         (ftype (function (boolean) integer) j)
         (ftype (function ((either integer boolean)) integer) m))
(defun i (integer) integer)
(defun j (boolean) (if boolean 1 0))
(defun m (integer-or-boolean)
  ;; m factorizes i and j because:
  ;; i = [#'m #'identity-integer-to-either]
  ;; j = [#'m #'identity-boolean-to-either]
  ;; NOTE: in this case identity-integer-to-either and
  ;; identity-boolean-to-either are both just identity
  (etypecase integer-or-boolean
    (integer integer-or-boolean)
    (boolean (if integer-or-boolean 1 0))))
