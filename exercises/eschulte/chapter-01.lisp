(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 1.
(defun my-identity (&rest arguments)
  (apply #'values arguments))

(defun my-compose (f g)
  ;; NOTE: Alexandria already has a compose, could just do [f g].
  (lambda (&rest args)
    (apply g (multiple-value-list (apply f args)))))
