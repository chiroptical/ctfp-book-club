(in-package :category-theory-for-programmers)
(in-readtable :curry-compose-reader-macros)

;;;; Chapter 4.

;;; (1) Define the Kleisli Category for partial functions.
;;;
;;;     - Composition of f and g.  Forall x in the domain of f is
;;;       defined on x then ((composition f g) x) is (g (f x)),
;;;       otherwise it is "invalid."

(defclass optional ()
  ((valid :initarg :valid :reader valid
          :initform (error "Required argument valid missing.")
          :type boolean)
   (payload :initarg :payload :reader payload :initform nil :type t)))

(declaim (ftype (function (function function) function) kleisli-compose))
(defun kleisli-compose (f g)
  (lambda (x)
    (let ((it (funcall f x)))
      (if (valid it)
          (funcall g (payload it))
          (make-instance 'optional-class :valid nil)))))

;;;     - The identity function takes a morphism in the original
;;;       category and maps it to an identical function in the Kleisli
;;;       Category.  In this case the function is total, so identity
;;;       is id(f) = (lambda (x) (values (f x) (constantly valid)))

(declaim (ftype (function (function) function) kleisli-identity))
(defun kleisli-identity (f)
  (lambda (x) (make-instance 'optional :payload (apply f x) :valid t)))

;;; 2. For this one we'll use a different optional type, which takes a
;;;    type which doesn't admit null and uses null to represent an
;;;    invalid return value--this is more idiomatic lisp than the
;;;    optional class above.  (Since we've already used the name
;;;    `optional' for a class we'll use `opt' for the type.

(deftype opt (type)
  `(or null ,type))

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(declaim (ftype (function ((opt single-float)) (opt single-float))
                safe-root)
         (inline safe-root))
(defun safe-root (x)
  (when (and x (> x 0))
    (sqrt x)))

(declaim (ftype (function ((opt single-float)) (opt single-float))
                safe-reciprocal)
         (inline safe-reciprocal))
(defun safe-reciprocal (x)
  (unless (or (not x) (zerop x))
    (/ 1 x)))

(declaim (ftype (function ((opt single-float)) (opt single-float))
                safe-root-reciprocal)
         (inline safe-root-reciprocal))
(defun safe-root-reciprocal (x)
  (declare (optimize (speed 3)))
  (safe-root (safe-reciprocal x)))

#+profile
(disassemble #'safe-root-reciprocal)
CL-USER> (disassemble #'safe-root-reciprocal)
; disassembly for SAFE-ROOT-RECIPROCAL
; Size: 148 bytes. Origin: #x22794666
; 66:       4881FA17001020   CMP RDX, #x20100017              ; no-arg-parsing entry point
                                                              ; NIL
; 6D:       7551             JNE L5
; 6F: L0:   B817001020       MOV EAX, #x20100017              ; NIL
; 74: L1:   483D17001020     CMP RAX, #x20100017              ; NIL
; 7A:       750B             JNE L4                           ; x is valid
; 7C: L2:   BA17001020       MOV EDX, #x20100017              ; NIL
; 81: L3:   488BE5           MOV RSP, RBP
; 84:       F8               CLC
; 85:       5D               POP RBP
; 86:       C3               RET                              ; return nil
; 87: L4:   66480F6EC0       MOVQ XMM0, RAX                   ; X
; 8C:       0FC6C0FD         SHUFPS XMM0, XMM0, #4r3331
; 90:       0F57C9           XORPS XMM1, XMM1                 ; 0
; 93:       0F2FC1           COMISS XMM0, XMM1
; 96:       7AE4             JP L2                            ; return null
; 98:       76E2             JBE L2
; 9A:       66480F6EC0       MOVQ XMM0, RAX
; 9F:       0FC6C0FD         SHUFPS XMM0, XMM0, #4r3331
; A3:       F30F5AC0         CVTSS2SD XMM0, XMM0
; A7:       F20F51C0         SQRTSD XMM0, XMM0                ; SQRT
; AB:       F20F5AC0         CVTSD2SS XMM0, XMM0
; AF:       0FC6C0FC         SHUFPS XMM0, XMM0, #4r3330
; B3:       660F7EC2         MOVD EDX, XMM0
; B7:       48C1E220         SHL RDX, 32
; BB:       80CA19           OR DL, 25
; BE:       EBC1             JMP L3
; C0: L5:   66480F6EC2       MOVQ XMM0, RDX
; C5:       0FC6C0FD         SHUFPS XMM0, XMM0, #4r3331
; C9:       0F57C9           XORPS XMM1, XMM1
; CC:       0F2FC1           COMISS XMM0, XMM1                ; zerop
; CF:       7A02             JP L6
; D1:       749C             JEQ L0                           ; re-use sqrt return nil
; D3: L6:   66480F6ECA       MOVQ XMM1, RDX
; D8:       0FC6C9FD         SHUFPS XMM1, XMM1, #4r3331
; DC:       F30F10053CFFFFFF MOVSS XMM0, [RIP-196]            ; [#x22794620]
; E4:       F30F5EC1         DIVSS XMM0, XMM1                 ; reciprocal
; E8:       0F28C8           MOVAPS XMM1, XMM0
; EB:       660F7EC8         MOVD EAX, XMM1
; EF:       48C1E020         SHL RAX, 32
; F3:       0C19             OR AL, 25
; F5:       E97AFFFFFF       JMP L1

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
