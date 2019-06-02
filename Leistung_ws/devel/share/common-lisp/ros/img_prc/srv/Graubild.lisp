; Auto-generated. Do not edit!


(cl:in-package img_prc-srv)


;//! \htmlinclude Graubild-request.msg.html

(cl:defclass <Graubild-request> (roslisp-msg-protocol:ros-message)
  ((img_org
    :reader img_org
    :initarg :img_org
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Graubild-request (<Graubild-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Graubild-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Graubild-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Graubild-request> is deprecated: use img_prc-srv:Graubild-request instead.")))

(cl:ensure-generic-function 'img_org-val :lambda-list '(m))
(cl:defmethod img_org-val ((m <Graubild-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_org-val is deprecated.  Use img_prc-srv:img_org instead.")
  (img_org m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Graubild-request>) ostream)
  "Serializes a message object of type '<Graubild-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_org) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Graubild-request>) istream)
  "Deserializes a message object of type '<Graubild-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_org) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Graubild-request>)))
  "Returns string type for a service object of type '<Graubild-request>"
  "img_prc/GraubildRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graubild-request)))
  "Returns string type for a service object of type 'Graubild-request"
  "img_prc/GraubildRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Graubild-request>)))
  "Returns md5sum for a message object of type '<Graubild-request>"
  "eb47099b9f958df018aedaea11c200fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Graubild-request)))
  "Returns md5sum for a message object of type 'Graubild-request"
  "eb47099b9f958df018aedaea11c200fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Graubild-request>)))
  "Returns full string definition for message of type '<Graubild-request>"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Graubild-request)))
  "Returns full string definition for message of type 'Graubild-request"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Graubild-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_org))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Graubild-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Graubild-request
    (cl:cons ':img_org (img_org msg))
))
;//! \htmlinclude Graubild-response.msg.html

(cl:defclass <Graubild-response> (roslisp-msg-protocol:ros-message)
  ((img_gray
    :reader img_gray
    :initarg :img_gray
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Graubild-response (<Graubild-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Graubild-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Graubild-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Graubild-response> is deprecated: use img_prc-srv:Graubild-response instead.")))

(cl:ensure-generic-function 'img_gray-val :lambda-list '(m))
(cl:defmethod img_gray-val ((m <Graubild-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_gray-val is deprecated.  Use img_prc-srv:img_gray instead.")
  (img_gray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Graubild-response>) ostream)
  "Serializes a message object of type '<Graubild-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_gray) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Graubild-response>) istream)
  "Deserializes a message object of type '<Graubild-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_gray) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Graubild-response>)))
  "Returns string type for a service object of type '<Graubild-response>"
  "img_prc/GraubildResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graubild-response)))
  "Returns string type for a service object of type 'Graubild-response"
  "img_prc/GraubildResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Graubild-response>)))
  "Returns md5sum for a message object of type '<Graubild-response>"
  "eb47099b9f958df018aedaea11c200fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Graubild-response)))
  "Returns md5sum for a message object of type 'Graubild-response"
  "eb47099b9f958df018aedaea11c200fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Graubild-response>)))
  "Returns full string definition for message of type '<Graubild-response>"
  (cl:format cl:nil "sensor_msgs/Image img_gray~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Graubild-response)))
  "Returns full string definition for message of type 'Graubild-response"
  (cl:format cl:nil "sensor_msgs/Image img_gray~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Graubild-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_gray))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Graubild-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Graubild-response
    (cl:cons ':img_gray (img_gray msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Graubild)))
  'Graubild-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Graubild)))
  'Graubild-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graubild)))
  "Returns string type for a service object of type '<Graubild>"
  "img_prc/Graubild")