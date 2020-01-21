(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 1.
(defun my-identity (&rest arguments)
  (apply #'values arguments))

(defun my-compose (f g)
  ;; NOTE: Alexandria already has a compose, could just do [f g].
  (lambda (&rest args)
    (apply g (multiple-value-list (apply f args)))))

#+test
(progn
  (def-generator mixed ()
    (generator (or (real) (integer) (string) (tuple (mixed) (mixed)))))

  (def-generator some-function ()
    (or #'sqrt #'list #'zerop {cons 1} {concatenate 'string "prefix "}))

  (assert
   (macrolet ((safely (function argument)
                `(ignore-errors (funcall ,function ,argument))))
     (check-it (generator (tuple (some-function) (mixed)))
               (lambda (pair)
                 (destructuring-bind (function argument) pair
                   (and (equalp
                         (safely (my-compose #'my-identity function) argument)
                         (safely function argument))
                        (equalp
                         (safely (my-compose #'my-identity function) argument)
                         (safely function argument)))))))
   () "My compose and identity make sense together.")

  :pass)
