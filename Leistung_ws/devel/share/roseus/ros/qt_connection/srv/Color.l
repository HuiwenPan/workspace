;; Auto-generated. Do not edit!


(when (boundp 'qt_connection::Color)
  (if (not (find-package "QT_CONNECTION"))
    (make-package "QT_CONNECTION"))
  (shadow 'Color (find-package "QT_CONNECTION")))
(unless (find-package "QT_CONNECTION::COLOR")
  (make-package "QT_CONNECTION::COLOR"))
(unless (find-package "QT_CONNECTION::COLORREQUEST")
  (make-package "QT_CONNECTION::COLORREQUEST"))
(unless (find-package "QT_CONNECTION::COLORRESPONSE")
  (make-package "QT_CONNECTION::COLORRESPONSE"))

(in-package "ROS")





(defclass qt_connection::ColorRequest
  :super ros::object
  :slots (_color_req ))

(defmethod qt_connection::ColorRequest
  (:init
   (&key
    ((:color_req __color_req) "")
    )
   (send-super :init)
   (setq _color_req (string __color_req))
   self)
  (:color_req
   (&optional __color_req)
   (if __color_req (setq _color_req __color_req)) _color_req)
  (:serialization-length
   ()
   (+
    ;; string _color_req
    4 (length _color_req)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _color_req
       (write-long (length _color_req) s) (princ _color_req s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _color_req
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color_req (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass qt_connection::ColorResponse
  :super ros::object
  :slots (_finish ))

(defmethod qt_connection::ColorResponse
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

(defclass qt_connection::Color
  :super ros::object
  :slots ())

(setf (get qt_connection::Color :md5sum-) "da328168331556f954624b109b527cef")
(setf (get qt_connection::Color :datatype-) "qt_connection/Color")
(setf (get qt_connection::Color :request) qt_connection::ColorRequest)
(setf (get qt_connection::Color :response) qt_connection::ColorResponse)

(defmethod qt_connection::ColorRequest
  (:response () (instance qt_connection::ColorResponse :init)))

(setf (get qt_connection::ColorRequest :md5sum-) "da328168331556f954624b109b527cef")
(setf (get qt_connection::ColorRequest :datatype-) "qt_connection/ColorRequest")
(setf (get qt_connection::ColorRequest :definition-)
      "string color_req
---
bool finish


")

(setf (get qt_connection::ColorResponse :md5sum-) "da328168331556f954624b109b527cef")
(setf (get qt_connection::ColorResponse :datatype-) "qt_connection/ColorResponse")
(setf (get qt_connection::ColorResponse :definition-)
      "string color_req
---
bool finish


")



(provide :qt_connection/Color "da328168331556f954624b109b527cef")


