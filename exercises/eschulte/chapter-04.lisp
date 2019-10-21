(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

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

#+profile
(disassemble #'safe-root)

#+profile
(let ((many (iter (for i :below 10000000)
                  (collect (float i)))))
  (time (prog1 :done (mapc #'safe-root-reciprocal many))))
;; Evaluation took:
;;   0.227 seconds of real time
;;   0.226636 seconds of total run time (0.226219 user, 0.000417 system)
;;   100.00% CPU
;;   751,113,878 processor cycles
;;   0 bytes consed
;;
;; :DONE
