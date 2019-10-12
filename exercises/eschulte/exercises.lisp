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


;;;; Chapter 6.
(defclass shape () ())

(defclass circle (shape)
  ((radius :initarg :radius :accessor radius :initform 0 :type number)))

(defclass rectangle (shape)
  ((width :initarg :width :accessor width :initform 0 :type number)
   (height :initarg :height :accessor height :initform 0 :type number)))

(declaim (ftype (function (shape) number) area))
(defgeneric area (shape)
  (:documentation "Return the area of SHAPE.")
  (:method ((circle circle))
    (* pi (radius circle) (radius circle)))
  (:method ((rectangle rectangle))
    (* (width rectangle) (height rectangle))))

(defgeneric circumference (shape)
  (:documentation "Return the circumference of SHAPE.")
  (:method ((circle circle))
    (* 2 pi (radius circle)))
  (:method ((rectangle rectangle))
    (* 2 (+ (width rectangle) (height rectangle)))))

(defclass square (shape)
  ((side :initarg :side :accessor side :initform 0 :type number)))

(defmethod area ((square square))
  (expt (side square) 2))

(defmethod circumference ((square square))
  (* 4 (side square)))

;;; Alternately, square could have been defined as a rectangle.
#+(or )
(progn
  (defclass square (rectangle)
    ((side :initarg :side :accessor side :initform 0 :type number)))

  (defmethod width ((square square)) (side square))
  (defmethod height ((square square)) (side square)))
