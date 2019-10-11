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
