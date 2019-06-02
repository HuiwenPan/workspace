;; Auto-generated. Do not edit!


(when (boundp 'move_control::ImgPoint)
  (if (not (find-package "MOVE_CONTROL"))
    (make-package "MOVE_CONTROL"))
  (shadow 'ImgPoint (find-package "MOVE_CONTROL")))
(unless (find-package "MOVE_CONTROL::IMGPOINT")
  (make-package "MOVE_CONTROL::IMGPOINT"))
(unless (find-package "MOVE_CONTROL::IMGPOINTREQUEST")
  (make-package "MOVE_CONTROL::IMGPOINTREQUEST"))
(unless (find-package "MOVE_CONTROL::IMGPOINTRESPONSE")
  (make-package "MOVE_CONTROL::IMGPOINTRESPONSE"))

(in-package "ROS")





(defclass move_control::ImgPointRequest
  :super ros::object
  :slots ())

(defmethod move_control::ImgPointRequest
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

(defclass move_control::ImgPointResponse
  :super ros::object
  :slots (_finish ))

(defmethod move_control::ImgPointResponse
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

(defclass move_control::ImgPoint
  :super ros::object
  :slots ())

(setf (get move_control::ImgPoint :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get move_control::ImgPoint :datatype-) "move_control/ImgPoint")
(setf (get move_control::ImgPoint :request) move_control::ImgPointRequest)
(setf (get move_control::ImgPoint :response) move_control::ImgPointResponse)

(defmethod move_control::ImgPointRequest
  (:response () (instance move_control::ImgPointResponse :init)))

(setf (get move_control::ImgPointRequest :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get move_control::ImgPointRequest :datatype-) "move_control/ImgPointRequest")
(setf (get move_control::ImgPointRequest :definition-)
      "---
bool finish

")

(setf (get move_control::ImgPointResponse :md5sum-) "474a58dbb494a45bb1ca99544cd64e45")
(setf (get move_control::ImgPointResponse :datatype-) "move_control/ImgPointResponse")
(setf (get move_control::ImgPointResponse :definition-)
      "---
bool finish

")



(provide :move_control/ImgPoint "474a58dbb494a45bb1ca99544cd64e45")


