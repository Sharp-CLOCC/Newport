(defsystem #:newport
  :version "1.0"
  :licence "LGPL"
  :description "Revival of CLOCC PORT's portable shell.lisp and sys.lisp."
  :author "Spenser Truex (maintainer/revivalist), and others."
  :long-description
  "CLOCC PORT is a now defunct library of extensions. Most of the old
functionality has been duplicated and maintained elsewhere (pathnames, utility
macros, etc.), but the shell and system interface facilities are reproduced
here and modernized. The original was licensed via LGPL, so it still is.

Automatically generated docs are available at http://spensertruex.com/newport.html

The dead project is available at:
http://clocc.sourceforge.net/dist/port.html

"
  :depends-on (#:alexandria #:uiop)
  :components
  ((:file "packages")
   (:file "pre-tests")
   (:file "ext" :depends-on ("packages"))
   (:file "shell" :depends-on ("packages" "ext"))
   (:file "sys" :depends-on ("packages" "ext"))
   (:file "tests" :depends-on ("packages" "shell" "sys" "ext")))
  #+5am :in-order-to #+5am ((test-op (test-op #:newport-tests))))
