;; Auto-generated. Do not edit!


(when (boundp 'img_prc::Kanten)
  (if (not (find-package "IMG_PRC"))
    (make-package "IMG_PRC"))
  (shadow 'Kanten (find-package "IMG_PRC")))
(unless (find-package "IMG_PRC::KANTEN")
  (make-package "IMG_PRC::KANTEN"))
(unless (find-package "IMG_PRC::KANTENREQUEST")
  (make-package "IMG_PRC::KANTENREQUEST"))
(unless (find-package "IMG_PRC::KANTENRESPONSE")
  (make-package "IMG_PRC::KANTENRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass img_prc::KantenRequest
  :super ros::object
  :slots (_img_org ))

(defmethod img_prc::KantenRequest
  (:init
   (&key
    ((:img_org __img_org) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _img_org __img_org)
   self)
  (:img_org
   (&rest __img_org)
   (if (keywordp (car __img_org))
       (send* _img_org __img_org)
     (progn
       (if __img_org (setq _img_org (car __img_org)))
       _img_org)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _img_org
    (send _img_org :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _img_org
       (send _img_org :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _img_org
     (send _img_org :deserialize buf ptr-) (incf ptr- (send _img_org :serialization-length))
   ;;
   self)
  )

(defclass img_prc::KantenResponse
  :super ros::object
  :slots (_img_kat ))

(defmethod img_prc::KantenResponse
  (:init
   (&key
    ((:img_kat __img_kat) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _img_kat __img_kat)
   self)
  (:img_kat
   (&rest __img_kat)
   (if (keywordp (car __img_kat))
       (send* _img_kat __img_kat)
     (progn
       (if __img_kat (setq _img_kat (car __img_kat)))
       _img_kat)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _img_kat
    (send _img_kat :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _img_kat
       (send _img_kat :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _img_kat
     (send _img_kat :deserialize buf ptr-) (incf ptr- (send _img_kat :serialization-length))
   ;;
   self)
  )

(defclass img_prc::Kanten
  :super ros::object
  :slots ())

(setf (get img_prc::Kanten :md5sum-) "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(setf (get img_prc::Kanten :datatype-) "img_prc/Kanten")
(setf (get img_prc::Kanten :request) img_prc::KantenRequest)
(setf (get img_prc::Kanten :response) img_prc::KantenResponse)

(defmethod img_prc::KantenRequest
  (:response () (instance img_prc::KantenResponse :init)))

(setf (get img_prc::KantenRequest :md5sum-) "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(setf (get img_prc::KantenRequest :datatype-) "img_prc/KantenRequest")
(setf (get img_prc::KantenRequest :definition-)
      "sensor_msgs/Image img_org

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
sensor_msgs/Image img_kat


================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")

(setf (get img_prc::KantenResponse :md5sum-) "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(setf (get img_prc::KantenResponse :datatype-) "img_prc/KantenResponse")
(setf (get img_prc::KantenResponse :definition-)
      "sensor_msgs/Image img_org

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
sensor_msgs/Image img_kat


================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")



(provide :img_prc/Kanten "8d2de0cb4df39c8a7c1e5d0934f5dd6b")

