;; Auto-generated. Do not edit!


(when (boundp 'qt_connection::EgoPos)
  (if (not (find-package "QT_CONNECTION"))
    (make-package "QT_CONNECTION"))
  (shadow 'EgoPos (find-package "QT_CONNECTION")))
(unless (find-package "QT_CONNECTION::EGOPOS")
  (make-package "QT_CONNECTION::EGOPOS"))
(unless (find-package "QT_CONNECTION::EGOPOSREQUEST")
  (make-package "QT_CONNECTION::EGOPOSREQUEST"))
(unless (find-package "QT_CONNECTION::EGOPOSRESPONSE")
  (make-package "QT_CONNECTION::EGOPOSRESPONSE"))

(in-package "ROS")





(defclass qt_connection::EgoPosRequest
  :super ros::object
  :slots (_x_req _y_req ))

(defmethod qt_connection::EgoPosRequest
  (:init
   (&key
    ((:x_req __x_req) 0.0)
    ((:y_req __y_req) 0.0)
    )
   (send-super :init)
   (setq _x_req (float __x_req))
   (setq _y_req (float __y_req))
   self)
  (:x_req
   (&optional __x_req)
   (if __x_req (setq _x_req __x_req)) _x_req)
  (:y_req
   (&optional __y_req)
   (if __y_req (setq _y_req __y_req)) _y_req)
  (:serialization-length
   ()
   (+
    ;; float64 _x_req
    8
    ;; float64 _y_req
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x_req
       (sys::poke _x_req (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_req
       (sys::poke _y_req (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x_req
     (setq _x_req (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_req
     (setq _y_req (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass qt_connection::EgoPosResponse
  :super ros::object
  :slots (_finish ))

(defmethod qt_connection::EgoPosResponse
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

(defclass qt_connection::EgoPos
  :super ros::object
  :slots ())

(setf (get qt_connection::EgoPos :md5sum-) "c0407d004a1efa7e56d28b80616e7c3e")
(setf (get qt_connection::EgoPos :datatype-) "qt_connection/EgoPos")
(setf (get qt_connection::EgoPos :request) qt_connection::EgoPosRequest)
(setf (get qt_connection::EgoPos :response) qt_connection::EgoPosResponse)

(defmethod qt_connection::EgoPosRequest
  (:response () (instance qt_connection::EgoPosResponse :init)))

(setf (get qt_connection::EgoPosRequest :md5sum-) "c0407d004a1efa7e56d28b80616e7c3e")
(setf (get qt_connection::EgoPosRequest :datatype-) "qt_connection/EgoPosRequest")
(setf (get qt_connection::EgoPosRequest :definition-)
      "float64 x_req
float64 y_req
---
bool finish
")

(setf (get qt_connection::EgoPosResponse :md5sum-) "c0407d004a1efa7e56d28b80616e7c3e")
(setf (get qt_connection::EgoPosResponse :datatype-) "qt_connection/EgoPosResponse")
(setf (get qt_connection::EgoPosResponse :definition-)
      "float64 x_req
float64 y_req
---
bool finish
")



(provide :qt_connection/EgoPos "c0407d004a1efa7e56d28b80616e7c3e")


