;; Auto-generated. Do not edit!


(when (boundp 'qt_connection::AbRatio)
  (if (not (find-package "QT_CONNECTION"))
    (make-package "QT_CONNECTION"))
  (shadow 'AbRatio (find-package "QT_CONNECTION")))
(unless (find-package "QT_CONNECTION::ABRATIO")
  (make-package "QT_CONNECTION::ABRATIO"))
(unless (find-package "QT_CONNECTION::ABRATIOREQUEST")
  (make-package "QT_CONNECTION::ABRATIOREQUEST"))
(unless (find-package "QT_CONNECTION::ABRATIORESPONSE")
  (make-package "QT_CONNECTION::ABRATIORESPONSE"))

(in-package "ROS")





(defclass qt_connection::AbRatioRequest
  :super ros::object
  :slots (_ratio_req ))

(defmethod qt_connection::AbRatioRequest
  (:init
   (&key
    ((:ratio_req __ratio_req) 0.0)
    )
   (send-super :init)
   (setq _ratio_req (float __ratio_req))
   self)
  (:ratio_req
   (&optional __ratio_req)
   (if __ratio_req (setq _ratio_req __ratio_req)) _ratio_req)
  (:serialization-length
   ()
   (+
    ;; float64 _ratio_req
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _ratio_req
       (sys::poke _ratio_req (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _ratio_req
     (setq _ratio_req (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass qt_connection::AbRatioResponse
  :super ros::object
  :slots (_finish ))

(defmethod qt_connection::AbRatioResponse
  (:init
   (&key
    ((:finish __finish) nil)
    )
   (send-super :init)
   (setq _finish __finish)
   self)
  (:finish
   (&optional __finish)
   (if __finish (setq _finish __finish)) _finish)
  (:serialization-length
   ()
   (+
    ;; bool _finish
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finish
       (if _finish (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finish
     (setq _finish (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass qt_connection::AbRatio
  :super ros::object
  :slots ())

(setf (get qt_connection::AbRatio :md5sum-) "61c5d5487d6721936edcd8f3bcc6605b")
(setf (get qt_connection::AbRatio :datatype-) "qt_connection/AbRatio")
(setf (get qt_connection::AbRatio :request) qt_connection::AbRatioRequest)
(setf (get qt_connection::AbRatio :response) qt_connection::AbRatioResponse)

(defmethod qt_connection::AbRatioRequest
  (:response () (instance qt_connection::AbRatioResponse :init)))

(setf (get qt_connection::AbRatioRequest :md5sum-) "61c5d5487d6721936edcd8f3bcc6605b")
(setf (get qt_connection::AbRatioRequest :datatype-) "qt_connection/AbRatioRequest")
(setf (get qt_connection::AbRatioRequest :definition-)
      "float64 ratio_req
---
bool finish
")

(setf (get qt_connection::AbRatioResponse :md5sum-) "61c5d5487d6721936edcd8f3bcc6605b")
(setf (get qt_connection::AbRatioResponse :datatype-) "qt_connection/AbRatioResponse")
(setf (get qt_connection::AbRatioResponse :definition-)
      "float64 ratio_req
---
bool finish
")



(provide :qt_connection/AbRatio "61c5d5487d6721936edcd8f3bcc6605b")


