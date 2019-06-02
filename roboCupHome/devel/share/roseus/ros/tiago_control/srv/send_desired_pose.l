;; Auto-generated. Do not edit!


(when (boundp 'tiago_control::send_desired_pose)
  (if (not (find-package "TIAGO_CONTROL"))
    (make-package "TIAGO_CONTROL"))
  (shadow 'send_desired_pose (find-package "TIAGO_CONTROL")))
(unless (find-package "TIAGO_CONTROL::SEND_DESIRED_POSE")
  (make-package "TIAGO_CONTROL::SEND_DESIRED_POSE"))
(unless (find-package "TIAGO_CONTROL::SEND_DESIRED_POSEREQUEST")
  (make-package "TIAGO_CONTROL::SEND_DESIRED_POSEREQUEST"))
(unless (find-package "TIAGO_CONTROL::SEND_DESIRED_POSERESPONSE")
  (make-package "TIAGO_CONTROL::SEND_DESIRED_POSERESPONSE"))

(in-package "ROS")





(defclass tiago_control::send_desired_poseRequest
  :super ros::object
  :slots (_x _y _theta ))

(defmethod tiago_control::send_desired_poseRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tiago_control::send_desired_poseResponse
  :super ros::object
  :slots (_reply ))

(defmethod tiago_control::send_desired_poseResponse
  (:init
   (&key
    ((:reply __reply) nil)
    )
   (send-super :init)
   (setq _reply __reply)
   self)
  (:reply
   (&optional __reply)
   (if __reply (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; bool _reply
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reply
       (if _reply (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reply
     (setq _reply (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass tiago_control::send_desired_pose
  :super ros::object
  :slots ())

(setf (get tiago_control::send_desired_pose :md5sum-) "92cc19f774a1a08ab88aade5806448d9")
(setf (get tiago_control::send_desired_pose :datatype-) "tiago_control/send_desired_pose")
(setf (get tiago_control::send_desired_pose :request) tiago_control::send_desired_poseRequest)
(setf (get tiago_control::send_desired_pose :response) tiago_control::send_desired_poseResponse)

(defmethod tiago_control::send_desired_poseRequest
  (:response () (instance tiago_control::send_desired_poseResponse :init)))

(setf (get tiago_control::send_desired_poseRequest :md5sum-) "92cc19f774a1a08ab88aade5806448d9")
(setf (get tiago_control::send_desired_poseRequest :datatype-) "tiago_control/send_desired_poseRequest")
(setf (get tiago_control::send_desired_poseRequest :definition-)
      "
float64 x
float64 y
float64 theta
---

bool reply

")

(setf (get tiago_control::send_desired_poseResponse :md5sum-) "92cc19f774a1a08ab88aade5806448d9")
(setf (get tiago_control::send_desired_poseResponse :datatype-) "tiago_control/send_desired_poseResponse")
(setf (get tiago_control::send_desired_poseResponse :definition-)
      "
float64 x
float64 y
float64 theta
---

bool reply

")



(provide :tiago_control/send_desired_pose "92cc19f774a1a08ab88aade5806448d9")


