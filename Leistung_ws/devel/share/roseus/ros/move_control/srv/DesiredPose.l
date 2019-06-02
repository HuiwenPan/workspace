;; Auto-generated. Do not edit!


(when (boundp 'move_control::DesiredPose)
  (if (not (find-package "MOVE_CONTROL"))
    (make-package "MOVE_CONTROL"))
  (shadow 'DesiredPose (find-package "MOVE_CONTROL")))
(unless (find-package "MOVE_CONTROL::DESIREDPOSE")
  (make-package "MOVE_CONTROL::DESIREDPOSE"))
(unless (find-package "MOVE_CONTROL::DESIREDPOSEREQUEST")
  (make-package "MOVE_CONTROL::DESIREDPOSEREQUEST"))
(unless (find-package "MOVE_CONTROL::DESIREDPOSERESPONSE")
  (make-package "MOVE_CONTROL::DESIREDPOSERESPONSE"))

(in-package "ROS")





(defclass move_control::DesiredPoseRequest
  :super ros::object
  :slots (_x_d _y_d _theta_d ))

(defmethod move_control::DesiredPoseRequest
  (:init
   (&key
    ((:x_d __x_d) 0.0)
    ((:y_d __y_d) 0.0)
    ((:theta_d __theta_d) 0.0)
    )
   (send-super :init)
   (setq _x_d (float __x_d))
   (setq _y_d (float __y_d))
   (setq _theta_d (float __theta_d))
   self)
  (:x_d
   (&optional __x_d)
   (if __x_d (setq _x_d __x_d)) _x_d)
  (:y_d
   (&optional __y_d)
   (if __y_d (setq _y_d __y_d)) _y_d)
  (:theta_d
   (&optional __theta_d)
   (if __theta_d (setq _theta_d __theta_d)) _theta_d)
  (:serialization-length
   ()
   (+
    ;; float64 _x_d
    8
    ;; float64 _y_d
    8
    ;; float64 _theta_d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x_d
       (sys::poke _x_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_d
       (sys::poke _y_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_d
       (sys::poke _theta_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x_d
     (setq _x_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_d
     (setq _y_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_d
     (setq _theta_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass move_control::DesiredPoseResponse
  :super ros::object
  :slots (_finish ))

(defmethod move_control::DesiredPoseResponse
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

(defclass move_control::DesiredPose
  :super ros::object
  :slots ())

(setf (get move_control::DesiredPose :md5sum-) "0a875362d8b56b739c21258a4954ddeb")
(setf (get move_control::DesiredPose :datatype-) "move_control/DesiredPose")
(setf (get move_control::DesiredPose :request) move_control::DesiredPoseRequest)
(setf (get move_control::DesiredPose :response) move_control::DesiredPoseResponse)

(defmethod move_control::DesiredPoseRequest
  (:response () (instance move_control::DesiredPoseResponse :init)))

(setf (get move_control::DesiredPoseRequest :md5sum-) "0a875362d8b56b739c21258a4954ddeb")
(setf (get move_control::DesiredPoseRequest :datatype-) "move_control/DesiredPoseRequest")
(setf (get move_control::DesiredPoseRequest :definition-)
      "float64 x_d
float64 y_d
float64 theta_d
---
bool finish

")

(setf (get move_control::DesiredPoseResponse :md5sum-) "0a875362d8b56b739c21258a4954ddeb")
(setf (get move_control::DesiredPoseResponse :datatype-) "move_control/DesiredPoseResponse")
(setf (get move_control::DesiredPoseResponse :definition-)
      "float64 x_d
float64 y_d
float64 theta_d
---
bool finish

")



(provide :move_control/DesiredPose "0a875362d8b56b739c21258a4954ddeb")


