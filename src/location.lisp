(in-package :cl-user)
(defpackage cl-weather-jp.location
  (:use #:cl
        #:cl-weather-jp.http
        #:cl-weather-jp.error
        #:cl-weather-jp.util)
  (:import-from #:function-cache
                #:defcached)
  (:export #:retrieve-city-id
           #:retrieve-city-weather))
(in-package :cl-weather-jp.location)

(defcached area-info ()
  (let ((area-xml
          (http-get "http://weather.livedoor.com/forecast/rss/primary_area.xml")))
    (map 'list
         (lambda (node)
           (let ((warn (clss:select "warn" node))
                 (cities (clss:select "city" node)))
             `(,(plump:get-attribute node "title")
               .
               (,@(if (= 0 (length warn))
                      nil
                      `(("warn" . (("source" . ,(plump:get-attribute (aref warn 0) "source"))))))
                ("cities"
                 . ,(map 'list (lambda (node)
                                 (cons (plump:get-attribute node "title")
                                       `(("id" . ,(plump:get-attribute node "id"))
                                         ("source" . ,(plump:get-attribute node "source")))))
                         cities))))))
         (clss:select "pref" (plump:parse area-xml)))))

(defun retrieve-city-id (city)
  (let ((info (area-info)))
    (dolist (pref info)
      (let ((city
              (aget (aget (cdr pref) "cities") city)))
        (when city
          (return-from retrieve-city-id
            (values (aget city "id"))))))))

(defun retrieve-city-weather (city)
  (let ((city-id (retrieve-city-id city)))
    (unless city-id
      (error 'unknown-location :location city))

    (jojo:parse
     (http-get (format nil "http://weather.livedoor.com/forecast/webservice/json/v1?city=~A"
                       city-id))
     :as :alist)))
