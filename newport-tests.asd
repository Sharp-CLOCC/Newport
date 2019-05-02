(asdf:defsystem :newport-tests
  :version      "0.0.0"
  :description  "Test newport to verify it works on a particular system."
  :author       "Spenser Truex <myself@spensertruex.com>"
  :serial       t
  :license      "GNU GPL, version 3"
  :components   ((:file "tests"))
  :depends-on   (#:newport #:alexandria #+5am #:fiveam)
  #+5am :perform (test-op (o s)
                          (run-tests)))
