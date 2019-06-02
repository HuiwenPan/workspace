;; Auto-generated. Do not edit!


(when (boundp 'create_map::create_map_srv)
  (if (not (find-package "CREATE_MAP"))
    (make-package "CREATE_MAP"))
  (shadow 'create_map_srv (find-package "CREATE_MAP")))
(unless (find-package "CREATE_MAP::CREATE_MAP_SRV")
  (make-package "CREATE_MAP::CREATE_MAP_SRV"))
(unless (find-package "CREATE_MAP::CREATE_MAP_SRVREQUEST")
  (make-package "CREATE_MAP::CREATE_MAP_SRVREQUEST"))
(unless (find-package "CREATE_MAP::CREATE_MAP_SRVRESPONSE")
  (make-package "CREATE_MAP::CREATE_MAP_SRVRESPONSE"))

(in-package "ROS")





(defclass create_map::create_map_srvRequest
  :super ros::object
  :slots (_x _y _theta _a _b _teamcolor ))

(defmethod create_map::create_map_srvRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:teamcolor __teamcolor) nil)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _teamcolor __teamcolor)
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
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:teamcolor
   (&optional __teamcolor)
   (if __teamcolor (setq _teamcolor __teamcolor)) _teamcolor)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; float32 _a
    4
    ;; float32 _b
    4
    ;; bool _teamcolor
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _teamcolor
       (if _teamcolor (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _teamcolor
     (setq _teamcolor (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass create_map::create_map_srvResponse
  :super ros::object
  :slots ())

(defmethod create_map::create_map_srvResponse
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

(defclass create_map::create_map_srv
  :super ros::object
  :slots ())

(setf (get create_map::create_map_srv :md5sum-) "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(setf (get create_map::create_map_srv :datatype-) "create_map/create_map_srv")
(setf (get create_map::create_map_srv :request) create_map::create_map_srvRequest)
(setf (get create_map::create_map_srv :response) create_map::create_map_srvResponse)

(defmethod create_map::create_map_srvRequest
  (:response () (instance create_map::create_map_srvResponse :init)))

(setf (get create_map::create_map_srvRequest :md5sum-) "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(setf (get create_map::create_map_srvRequest :datatype-) "create_map/create_map_srvRequest")
(setf (get create_map::create_map_srvRequest :definition-)
      "float32                x
float32                y
float32                theta
float32                a
float32                b
bool                   teamcolor
---
")

(setf (get create_map::create_map_srvResponse :md5sum-) "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(setf (get create_map::create_map_srvResponse :datatype-) "create_map/create_map_srvResponse")
(setf (get create_map::create_map_srvResponse :definition-)
      "float32                x
float32                y
float32                theta
float32                a
float32                b
bool                   teamcolor
---
")



(provide :create_map/create_map_srv "ce11d8a36ed22138f3ccd3ee60b5ca4a")


