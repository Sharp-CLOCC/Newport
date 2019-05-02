#+5am (in-package :newport-tests)

#+5am (defun run-tests (&optional allp)
        "Required for the ASDF test-op."
        (if allp
            (run! 'tests)
            (progn (run! 'mandatory)
                   (format t "~%Mandatory tests passed. Run ALL tests with (~S:run-tests t)."
                           (package-name *package*)))))
