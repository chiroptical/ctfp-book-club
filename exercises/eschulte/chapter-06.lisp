(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 6.
(defclass shape () ())

(defclass circle (shape)
  ((radius :initarg :radius :accessor radius :initform 0 :type single-float)))

(defclass rectangle (shape)
  ((width :initarg :width :accessor width :initform 0 :type single-float)
   (height :initarg :height :accessor height :initform 0 :type single-float)))

(declaim (ftype (function (shape) double-float) area))
(defgeneric area (shape)
  (:documentation "Return the area of SHAPE.")
  (:method ((circle circle))
    (let ((r (the single-float (radius circle))))
      (* pi r r)))
  (:method ((rectangle rectangle))
    (* (the single-float (width rectangle))
       (the single-float (height rectangle)))))

(declaim (ftype (function (shape) double-float) circumference))
(defgeneric circumference (shape)
  (:documentation "Return the circumference of SHAPE.")
  (:method ((circle circle))
    (* 2 pi (the single-float (radius circle))))
  (:method ((rectangle rectangle))
    (* 2 (+ (the single-float (width rectangle))
            (the single-float (height rectangle))))))

(defclass square (shape)
  ((side :initarg :side :accessor side :initform 0 :type single-float)))

(defmethod area ((square square))
  (expt (the single-float (side square)) 2))

(defmethod circumference ((square square))
  (* 4 (the single-float (side square))))

;;; Alternately, square could have been defined as a rectangle.
#+alternate
(progn
  (defclass square (rectangle)
    ((side :initarg :side :accessor side :initform 0 :type single-float)))

  (defmethod width ((square square)) (side square))
  (defmethod height ((square square)) (side square)))
