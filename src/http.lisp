(in-package :cl-user)
(defpackage cl-weather-jp.http
  (:use #:cl)
  (:export #:http-get))
(in-package :cl-weather-jp.http)

(defparameter *default-user-agent*
  (format nil "cl-weather-jp/~A (~A~@[ ~A~]); ~A;~@[ ~A~]"
          (asdf:component-version (asdf:find-system :cl-weather-jp))
          (or (lisp-implementation-type) "Common Lisp")
          (or (lisp-implementation-version) "")
          (or #-clisp (software-type)
              #+(or win32 mswindows) "Windows"
              #-(or win32 mswindows) "Unix")
          (or #-clisp (software-version))))

(defun http-get (url)
  (handler-bind ((dex:http-request-failed (dex:retry-request 10)))
    (dex:get url
             :headers `(("User-Agent" . ,*default-user-agent*)))))
