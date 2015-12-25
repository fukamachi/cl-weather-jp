(in-package :cl-user)
(defpackage cl-weather-jp-test
  (:use :cl
        :cl-weather-jp
        :prove))
(in-package :cl-weather-jp-test)

(plan 3)

(ok (city-forecasts "東京")
    "Can retrieve forecasts for 東京")

(ok (city-forecasts "福島")
    "Can retrieve forecasts for 福島")

(is-error (city-forecasts "ホーチミン")
          'unknown-location)

(finalize)
