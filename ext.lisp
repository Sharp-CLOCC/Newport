(in-package :newport)
#+5am (in-suite newport-tests:mandatory)


(defmacro defconst (name type init doc)
  "Define a typed constant."
  ;; Was trying push type checking to alexandria's analogous define-constant.
  ;; (if (fboundp '#1=alexandria:define-constant)
  ;;  `(alexandria:define-constant ,name ,init :type ,type :documentation ,doc)
  `(progn (declaim (type ,type ,name))
          ;; since constant redefinition must be the same under EQL, there
          ;; can be no constants other than symbols, numbers and characters
          ;; see ANSI CL spec 3.1.2.1.1.3 "Constant Variables"
          (,(if (subtypep type '(or symbol number character)) 'defconstant 'defvar)
           ,name (the ,type ,init) ,doc))
  ;; )
  )
#+5am (test defconst (signals t
                       (let ((testing+ (gensym)))
                         (eval `(defconst ,testing+ integer #\a "broken"))))
            (is (= 1 (let ((testing+ (gensym)))
                       (eval `(progn (defconst ,testing+ integer 1 "OK")
                                     (defconst ,testing+ integer 1 "OK")
                                     ,testing+)))))
            (signals t (let ((testing+ (gensym)))
                         (eval `(defconst ,testing+ integer 1))
                         (eval `(defconst ,testing+ integer 2)))))

(declaim (inline compose))
(defun compose (&rest functions)
  (apply #'alexandria:compose functions))

#+5am (test compose (for-all ((x (gen-integer :max (- most-positive-fixnum 2))))
                      (is  (= (/ (1+ x) 2)
                              (funcall (compose #'(lambda (x) (/ x 2)) #'1+)
                                       x))))
            (is (equal '(1 2 3 4)
                       (let ((<-fn1 #'(lambda (x) (cons 1 x)))
                             (<-fn2 #'(lambda (x) (cons 2 x)))
                             (<-fn3 #'(lambda (x) (cons 3 x)))
                             (<-fn4 #'(lambda (x) (cons 4 x))))
                         (funcall (compose <-fn1 <-fn2 <-fn3 <-fn4) nil)))))

(defmacro mk-arr (type init &optional len)
  "Make array with elements of TYPE, initializing."
  (if len `(make-array ,len :element-type ,type :initial-element ,init)
      `(make-array (length ,init) :element-type ,type
                                  :initial-contents ,init)))
#+5am (test mk-arr (for-all ((x (gen-integer))
                             (l (gen-integer :min 1 :max 100)))
                     (is (equalp (mk-arr 'integer x l)
                                 (mk-arr 'integer (loop for y from 1 to l
                                                        collect x)))))
            (signals type-error (mk-arr 'character 1)))
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
#+5am (test conditions (signals code (signal 'code))
            (signals not-implemented (signal 'not-implemented)))
