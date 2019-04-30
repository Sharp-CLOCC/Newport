(in-package :cl-user)
(defpackage #:newport
  (:use #:cl
        #+(and allego mswindos) #:ole
        #+sbcl :sb-introspect
        )
  (:export :run-prog :pipe-output ;; shell.lisp
           :pipe-input :close-pipe
           :with-open-pipe

           ;; sys.lisp
   :getenv :variable-special-p :variable-not-special :arglist
   :class-slot-list :class-slot-initargs
   :structure-slots :structure-keyword-constructor :structure-boa-constructors
           :structure-copier :structure-predicate
           :+month-names+ :+week-days+ :+time-zones+ :tz->string :string->tz
   :current-time :sysinfo))
(in-package :newport)
