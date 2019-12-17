(defpackage :category-theory-for-programmers
  (:nicknames :ctfp)
  (:use :common-lisp
        :alexandria
        :named-readtables
        :curry-compose-reader-macros
        :uiop/utility
        :iterate
        :check-it
        :graph)
  (:shadowing-import-from :alexandria :appendf :if-let :parse-body
                          :ensure-list :ensure-function :ensure-gethash
                          :simple-style-warning :emptyp)
  (:shadowing-import-from :check-it :generate))
