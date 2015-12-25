(in-package :cl-user)
(defpackage cl-weather-jp-test
  (:use :cl
        :cl-weather-jp
        :prove))
(in-package :cl-weather-jp-test)

(plan 2)

(subtest "city-forecasts"
  (ok (city-forecasts "東京")
      "Can retrieve forecasts for 東京")

  (ok (city-forecasts "福島")
      "Can retrieve forecasts for 福島")

  (is-error (city-forecasts "ホーチミン")
            'unknown-location))

(subtest "city-forecast-detail-url"
  (ok (city-forecast-detail-url "東京"))
  (ok (city-forecast-detail-url "福島"))
  (is-error (city-forecast-detail-url "オワフ島")
            'unknown-location))

(finalize)
