;; Auto-generated. Do not edit!


(when (boundp 'qt_connection::Ready)
  (if (not (find-package "QT_CONNECTION"))
    (make-package "QT_CONNECTION"))
  (shadow 'Ready (find-package "QT_CONNECTION")))
(unless (find-package "QT_CONNECTION::READY")
  (make-package "QT_CONNECTION::READY"))
(unless (find-package "QT_CONNECTION::READYREQUEST")
  (make-package "QT_CONNECTION::READYREQUEST"))
(unless (find-package "QT_CONNECTION::READYRESPONSE")
  (make-package "QT_CONNECTION::READYRESPONSE"))

(in-package "ROS")





(defclass qt_connection::ReadyRequest
  :super ros::object
  :slots ())

(defmethod qt_connection::ReadyRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass qt_connection::ReadyResponse
  :super ros::object
  :slots (_finish ))

(defmethod qt_connection::ReadyResponse
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

(defclass qt_connection::Ready
  :super ros::object
  :slots ())

(setf (get qt_connection::Ready :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get qt_connection::Ready :datatype-) "qt_connection/Ready")
(setf (get qt_connection::Ready :request) qt_connection::ReadyRequest)
(setf (get qt_connection::Ready :response) qt_connection::ReadyResponse)

(defmethod qt_connection::ReadyRequest
  (:response () (instance qt_connection::ReadyResponse :init)))

(setf (get qt_connection::ReadyRequest :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get qt_connection::ReadyRequest :datatype-) "qt_connection/ReadyRequest")
(setf (get qt_connection::ReadyRequest :definition-)
      "---
bool finish
")

(setf (get qt_connection::ReadyResponse :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get qt_connection::ReadyResponse :datatype-) "qt_connection/ReadyResponse")
(setf (get qt_connection::ReadyResponse :definition-)
      "---
bool finish
")



(provide :qt_connection/Ready "474a58dbb494a45bb1ca99544cd64e45")


