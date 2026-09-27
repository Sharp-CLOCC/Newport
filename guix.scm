;;; guix.scm --- Guix package for newport.  Build with: guix build -f guix.scm
;;; Install with: guix package -f guix.scm
(use-modules (guix packages) (guix gexp) (guix build-system asdf)
             ((guix licenses) #:prefix license:)
             (gnu packages lisp) (gnu packages lisp-xyz) (gnu packages lisp-check))

(define %source-dir (dirname (current-filename)))

(define-public sbcl-newport
  (package
    (name "sbcl-newport")
    (version "1.0")
    (source (local-file %source-dir "newport-checkout"
                        #:recursive? #t
                        #:select? (lambda (file stat)
                                    (not (or (string-suffix? ".fasl" file)
                                             (string-contains file "/.git"))))))
    (build-system asdf-build-system/sbcl)
    (arguments
     (list #:asd-systems ''("newport")
           #:phases
           #~(modify-phases %standard-phases
               ;; the .asd does not declare everything the sources use; fix the build copy
               (add-after 'unpack 'fix-asd-deps
                 (lambda _
                   (substitute* "newport.asd"
                     (("\\(#:alexandria #:uiop\\)") "(#:alexandria #:uiop #:sb-posix)")))))))
    (inputs (list
                  sbcl-alexandria))
    (synopsis "Revival of CLOCC PORT's portable shell")
    (description "Revival of CLOCC PORT's portable shell.lisp and sys.lisp.")
    (home-page "https://github.com/equwal/Newport")
    (license license:lgpl2.1)))

(define-public cl-newport
  (sbcl-package->cl-source-package sbcl-newport))

sbcl-newport
