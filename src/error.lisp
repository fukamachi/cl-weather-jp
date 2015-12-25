(in-package :cl-user)
(defpackage cl-weather-jp.error
  (:use #:cl)
  (:export #:unknown-location))
(in-package :cl-weather-jp.error)

(define-condition unknown-location (error)
  ((location :initarg :location))
  (:report (lambda (condition stream)
             (format stream "Location ~S is unknown"
                     (slot-value condition 'location)))))
