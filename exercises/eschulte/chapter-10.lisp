(defpackage :category-theory-for-programmers/chapter-10
  (:nicknames :ctfp/10)
  (:use :gt))
(in-package :category-theory-for-programmers/chapter-10)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 10.

;;; 1. Define a natural transformation from the Maybe functor to the
;;;    List functor.

;;; Unnecessary arguably akward recreation of the types in common lisp.
(deftype nothing (type1) (declare (ignorable type1)) nil)
(deftype just (type1) type1)
(deftype maybe (type1) `(or (just ,type1) (nothing ,type1)))

(deftype list-of (type1) `(or nil (cons ,type1 (list-of ,type1))))

(declaim (type (ftype (function (maybe t)) (list-of t)) alpha))
(defun alpha (a-maybe)
  (ecase a-maybe
    (nil nil)
    (t (list a-maybe))))

;;; We need to prove that:
;;;   [{maybe f} alpha] = [alpha {mapcar f}]
;;;   
