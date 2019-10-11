(defpackage :category-theory-for-programmers/exercises
  (:nicknames :ctfp)
  (:use :common-lisp
        :alexandria
        :named-readtables
        :curry-compose-reader-macros
        :uiop/utility)
  (:shadowing-import-from :alexandria :appendf :if-let :parse-body
                          :ensure-list :ensure-function :ensure-gethash
                          :simple-style-warning :emptyp))
(in-package :category-theory-for-programmers/exercises)
(in-readtable :curry-compose-reader-macros)


;;;; Chapter 1.

;;; 1.1
(defun my-identity (&rest arguments)
  (apply #'values arguments))

;;; 1.2
(defun my-compose (f g)
  "Alexandria already has a compose, could just do [f g]."
  (lambda (&rest args)
    (apply g (multiple-value-list (apply f args)))))
