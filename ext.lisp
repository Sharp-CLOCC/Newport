;;; Basic extensions: conditions, compositions &c
;;;
;;; Copyright (C) 1999-2008, 2010 by Sam Steingold
;;; This is open-source software.
;;; GNU Lesser General Public License (LGPL) is applicable:
;;; No warranty; you may copy/modify/redistribute under the same
;;; conditions with the source code.
;;; See <URL:http://www.gnu.org/copyleft/lesser.html>
;;; for details and the precise copyright document.

;;; Copyright (C) 2019 Spenser Truex (maintenance)


(in-package :newport)

(defmacro defconst (name type init doc)
  "Define a typed constant."
  (if (fboundp '#1=alexandria:define-constant)
      `(#1# ,name ,init :type ,type :documentation ,doc)
      `(progn ,(if type `(declaim (type ,type ,name)))
              (defconstant ,name (%reevaluate-constant ',name (the ,type ,initial-value)
                                                       ,test)
                ,@(when documentation `(,documentation))))))
(defmacro compose (&rest functions)
  `(alexandria:compose ,@functions))
(defmacro mk-arr (type init &optional len)
  "Make array with elements of TYPE, initializing."
  (if len `(make-array ,len :element-type ,type :initial-element ,init)
      `(make-array (length ,init) :element-type ,type
                                  :initial-contents ,init)))
(define-condition code (error)
  ((proc :reader code-proc :initarg :proc :initform nil)
   (mesg :type (or null simple-string) :reader code-mesg
         :initarg :mesg :initform nil)
   (args :type list :reader code-args :initarg :args :initform nil))
  (:documentation "An error in the user code.")
  (:report (lambda (cc out)
             (declare (stream out))
             (format out "[~s]~@[ ~?~]" (code-proc cc) (code-mesg cc)
                     (code-args cc)))))
(define-condition not-implemented (code)
  ((mesg :type simple-string :reader code-mesg :initform
         "not implemented for ~a [~a]")
   (args :type list :reader code-args :initform
         (list (lisp-implementation-type) (lisp-implementation-version))))
  (:documentation "Your implementation does not support this functionality."))
