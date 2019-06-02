; Auto-generated. Do not edit!


(cl:in-package img_prc-srv)


;//! \htmlinclude Kanten-request.msg.html

(cl:defclass <Kanten-request> (roslisp-msg-protocol:ros-message)
  ((img_org
    :reader img_org
    :initarg :img_org
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Kanten-request (<Kanten-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Kanten-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Kanten-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Kanten-request> is deprecated: use img_prc-srv:Kanten-request instead.")))

(cl:ensure-generic-function 'img_org-val :lambda-list '(m))
(cl:defmethod img_org-val ((m <Kanten-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_org-val is deprecated.  Use img_prc-srv:img_org instead.")
  (img_org m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Kanten-request>) ostream)
  "Serializes a message object of type '<Kanten-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_org) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Kanten-request>) istream)
  "Deserializes a message object of type '<Kanten-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_org) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Kanten-request>)))
  "Returns string type for a service object of type '<Kanten-request>"
  "img_prc/KantenRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Kanten-request)))
  "Returns string type for a service object of type 'Kanten-request"
  "img_prc/KantenRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Kanten-request>)))
  "Returns md5sum for a message object of type '<Kanten-request>"
  "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Kanten-request)))
  "Returns md5sum for a message object of type 'Kanten-request"
  "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Kanten-request>)))
  "Returns full string definition for message of type '<Kanten-request>"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Kanten-request)))
  "Returns full string definition for message of type 'Kanten-request"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Kanten-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_org))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Kanten-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Kanten-request
    (cl:cons ':img_org (img_org msg))
))
;//! \htmlinclude Kanten-response.msg.html

(cl:defclass <Kanten-response> (roslisp-msg-protocol:ros-message)
  ((img_kat
    :reader img_kat
    :initarg :img_kat
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Kanten-response (<Kanten-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Kanten-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Kanten-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Kanten-response> is deprecated: use img_prc-srv:Kanten-response instead.")))

(cl:ensure-generic-function 'img_kat-val :lambda-list '(m))
(cl:defmethod img_kat-val ((m <Kanten-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_kat-val is deprecated.  Use img_prc-srv:img_kat instead.")
  (img_kat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Kanten-response>) ostream)
  "Serializes a message object of type '<Kanten-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_kat) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Kanten-response>) istream)
  "Deserializes a message object of type '<Kanten-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_kat) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Kanten-response>)))
  "Returns string type for a service object of type '<Kanten-response>"
  "img_prc/KantenResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Kanten-response)))
  "Returns string type for a service object of type 'Kanten-response"
  "img_prc/KantenResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Kanten-response>)))
  "Returns md5sum for a message object of type '<Kanten-response>"
  "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Kanten-response)))
  "Returns md5sum for a message object of type 'Kanten-response"
  "8d2de0cb4df39c8a7c1e5d0934f5dd6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Kanten-response>)))
  "Returns full string definition for message of type '<Kanten-response>"
  (cl:format cl:nil "sensor_msgs/Image img_kat~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Kanten-response)))
  "Returns full string definition for message of type 'Kanten-response"
  (cl:format cl:nil "sensor_msgs/Image img_kat~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Kanten-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_kat))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Kanten-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Kanten-response
    (cl:cons ':img_kat (img_kat msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Kanten)))
  'Kanten-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Kanten)))
  'Kanten-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Kanten)))
  "Returns string type for a service object of type '<Kanten>"
  "img_prc/Kanten")