# cl-weather-jp

[![Build Status](https://travis-ci.org/fukamachi/cl-weather-jp.svg?branch=master)](https://travis-ci.org/fukamachi/cl-weather-jp)
[![Coverage Status](https://coveralls.io/repos/fukamachi/cl-weather-jp/badge.svg?branch=master)](https://coveralls.io/r/fukamachi/cl-weather-jp)
[![Quicklisp dist](http://quickdocs.org/badge/cl-weather-jp.svg)](http://quickdocs.org/cl-weather-jp/)

cl-weather-jp allows you to retrieve the weather in Japan via [Livedoor Weather](http://weather.livedoor.com).

## Usage

```common-lisp
(use-package :cl-weather-jp)

(city-forecasts "東京")
;=> ((("image" ("height" . 31) ("title" . "晴時々曇")
;      ("url" . "http://weather.livedoor.com/img/icon/2.gif") ("width" . 50))
;     ("temperature" ("max" ("fahrenheit" . "60.8") ("celsius" . "16")) ("min"))
;     ("date" . "2015-12-25") ("telop" . "晴時々曇") ("dateLabel" . "今日"))
;    (("image" ("height" . 31) ("title" . "晴れ")
;      ("url" . "http://weather.livedoor.com/img/icon/1.gif") ("width" . 50))
;     ("temperature" ("max" ("fahrenheit" . "57.2") ("celsius" . "14"))
;      ("min" ("fahrenheit" . "41.0") ("celsius" . "5")))
;     ("date" . "2015-12-26") ("telop" . "晴れ") ("dateLabel" . "明日"))
;    (("image" ("height" . 31) ("title" . "晴時々曇")
;      ("url" . "http://weather.livedoor.com/img/icon/2.gif") ("width" . 50))
;     ("temperature" ("max") ("min")) ("date" . "2015-12-27") ("telop" . "晴時々曇")
;     ("dateLabel" . "明後日")))
```

## Installation

```
$ cd ~/common-lisp
$ git clone https://github.com/fukamachi/cl-weather-jp
```

```common-lisp
(ql:quickload :cl-weather-jp)
```

## Author

* Eitaro Fukamachi (e.arrows@gmail.com)

## Copyright

Copyright (c) 2015 Eitaro Fukamachi (e.arrows@gmail.com)

## License

Licensed under the BSD 2-Clause License.
