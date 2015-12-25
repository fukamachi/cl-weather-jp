(in-package :cl-user)
(defpackage cl-weather-jp
  (:use #:cl
        #:cl-weather-jp.location
        #:cl-weather-jp.error
        #:cl-weather-jp.util)
  (:export #:city-forecasts
           #:city-forecast-detail-url
           #:unknown-location))
(in-package :cl-weather-jp)

(defun city-forecasts (city)
  (let ((info (retrieve-city-weather city)))
    (values (aget info "forecasts"))))

(defun city-forecast-detail-url (city)
  (values (aget (retrieve-city-weather city) "link")))
