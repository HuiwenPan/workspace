;; Auto-generated. Do not edit!


(when (boundp 'simple_move::simple_move_server)
  (if (not (find-package "SIMPLE_MOVE"))
    (make-package "SIMPLE_MOVE"))
  (shadow 'simple_move_server (find-package "SIMPLE_MOVE")))
(unless (find-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVER")
  (make-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVER"))
(unless (find-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVERREQUEST")
  (make-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVERREQUEST"))
(unless (find-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVERRESPONSE")
  (make-package "SIMPLE_MOVE::SIMPLE_MOVE_SERVERRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass simple_move::simple_move_serverRequest
  :super ros::object
  :slots (_Execute ))

(defmethod simple_move::simple_move_serverRequest
  (:init
   (&key
    ((:Execute __Execute) nil)
    )
   (send-super :init)
   (setq _Execute __Execute)
   self)
  (:Execute
   (&optional __Execute)
   (if __Execute (setq _Execute __Execute)) _Execute)
  (:serialization-length
   ()
   (+
    ;; bool _Execute
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _Execute
       (if _Execute (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _Execute
     (setq _Execute (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass simple_move::simple_move_serverResponse
  :super ros::object
  :slots (_final_pose ))

(defmethod simple_move::simple_move_serverResponse
  (:init
   (&key
    ((:final_pose __final_pose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _final_pose __final_pose)
   self)
  (:final_pose
   (&rest __final_pose)
   (if (keywordp (car __final_pose))
       (send* _final_pose __final_pose)
     (progn
       (if __final_pose (setq _final_pose (car __final_pose)))
       _final_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _final_pose
    (send _final_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _final_pose
       (send _final_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _final_pose
     (send _final_pose :deserialize buf ptr-) (incf ptr- (send _final_pose :serialization-length))
   ;;
   self)
  )

(defclass simple_move::simple_move_server
  :super ros::object
  :slots ())

(setf (get simple_move::simple_move_server :md5sum-) "05a3b190b2a3e8da10e3d0069fe74dbc")
(setf (get simple_move::simple_move_server :datatype-) "simple_move/simple_move_server")
(setf (get simple_move::simple_move_server :request) simple_move::simple_move_serverRequest)
(setf (get simple_move::simple_move_server :response) simple_move::simple_move_serverResponse)

(defmethod simple_move::simple_move_serverRequest
  (:response () (instance simple_move::simple_move_serverResponse :init)))

(setf (get simple_move::simple_move_serverRequest :md5sum-) "05a3b190b2a3e8da10e3d0069fe74dbc")
(setf (get simple_move::simple_move_serverRequest :datatype-) "simple_move/simple_move_serverRequest")
(setf (get simple_move::simple_move_serverRequest :definition-)
      "bool  Execute
---
geometry_msgs/Pose2D final_pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
")

(setf (get simple_move::simple_move_serverResponse :md5sum-) "05a3b190b2a3e8da10e3d0069fe74dbc")
(setf (get simple_move::simple_move_serverResponse :datatype-) "simple_move/simple_move_serverResponse")
(setf (get simple_move::simple_move_serverResponse :definition-)
      "bool  Execute
---
geometry_msgs/Pose2D final_pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
")



(provide :simple_move/simple_move_server "05a3b190b2a3e8da10e3d0069fe74dbc")


