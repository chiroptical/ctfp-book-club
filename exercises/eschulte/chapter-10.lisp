(defpackage :category-theory-for-programmers/chapter-10
  (:nicknames :ctfp/10)
  (:use :gt))
(in-package :category-theory-for-programmers/chapter-10)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 10.

;;; 1. Define a natural transformation from the Maybe functor to the
;;;    List functor.

;;; Unnecessary arguably akward recreation of maybe in common lisp.
(defclass maybe ()
  ((just :accessor just :initarg :just)))
(defmethod print-object ((maybe maybe) stream)
  (print-unreadable-object (maybe stream :type 'maybe)
    (write (just maybe) :stream stream)))

(defmethod mapcar (f (maybe maybe) &rest more-maybes)
  (apply #'values
         (iter (for m in (cons maybe more-maybes))
               (when (just m)
                 (collect (make-instance 'maybe :just (funcall f (just m))))))))

(defun alpha (maybe)
  (case (just maybe)
    (nil nil)
    (t (list (just maybe)))))

;;; We need to prove that:
;;;   (map-list f) . alpha = alpha . (map-maybe f)
;;;
;;; We consider both cases of Maybe (Just and Nil):
;;;   Nil: alpha . (map-maybe f) nil = alpha nil = nil
