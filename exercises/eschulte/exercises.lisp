(defpackage :category-theory-for-programmers/exercises
  (:nicknames :category-theory-for-programmers :ctfp)
  (:use :common-lisp
        :alexandria
        :named-readtables
        :curry-compose-reader-macros
        :uiop/utility
        :iterate)
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


;;;; Chapter 4.
(deftype optional (type)
  `(or null ,type))

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(declaim (ftype (function ((optional single-float)) (optional single-float))
                safe-root)
         (inline safe-root))
(defun safe-root (single-float)
  (when (and single-float (> single-float 0))
    (sqrt single-float)))

(declaim (ftype (function ((optional single-float)) (optional single-float))
                safe-reciprocal)
         (inline safe-reciprocal))
(defun safe-reciprocal (single-float)
  (unless (zerop single-float)
    (/ 1 single-float)))

(declaim (ftype (function ((optional single-float)) (optional single-float))
                safe-root-reciprocal)
         (inline safe-root-reciprocal))
(defun safe-root-reciprocal (single-float)
  (declare (optimize (speed 3)))
  (safe-root (safe-reciprocal single-float)))

;; CTFP> (let ((many (iter (for i :below 10000000)
;;                         (collect (float i)))))
;;         (time (prog1 :done (mapc #'safe-root-reciprocal many))))
;; Evaluation took:
;;   0.227 seconds of real time
;;   0.226636 seconds of total run time (0.226219 user, 0.000417 system)
;;   100.00% CPU
;;   751,113,878 processor cycles
;;   0 bytes consed
;;
;; :DONE
