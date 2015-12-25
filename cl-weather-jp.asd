#|
  This file is a part of cl-weather-jp project.
  Copyright (c) 2015 Eitaro Fukamachi (e.arrows@gmail.com)
|#

#|
  Get weather in Japan

  Author: Eitaro Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-weather-jp-asd
  (:use :cl :asdf))
(in-package :cl-weather-jp-asd)

(defsystem cl-weather-jp
  :version "0.1"
  :author "Eitaro Fukamachi"
  :license "BSD 2-Clause"
  :depends-on (:dexador
               :plump
               :clss
               :jonathan
               :function-cache)
  :components ((:module "src"
                :components
                ((:file "cl-weather-jp" :depends-on ("location" "util"))
                 (:file "location" :depends-on ("http" "error" "util"))
                 (:file "http")
                 (:file "error")
                 (:file "util"))))
  :description "Get weather in Japan"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-weather-jp-test))))
