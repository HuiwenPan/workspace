; Auto-generated. Do not edit!


(cl:in-package img_prc-srv)


;//! \htmlinclude Dominant-request.msg.html

(cl:defclass <Dominant-request> (roslisp-msg-protocol:ros-message)
  ((img_org
    :reader img_org
    :initarg :img_org
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Dominant-request (<Dominant-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Dominant-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Dominant-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Dominant-request> is deprecated: use img_prc-srv:Dominant-request instead.")))

(cl:ensure-generic-function 'img_org-val :lambda-list '(m))
(cl:defmethod img_org-val ((m <Dominant-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_org-val is deprecated.  Use img_prc-srv:img_org instead.")
  (img_org m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Dominant-request>) ostream)
  "Serializes a message object of type '<Dominant-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_org) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Dominant-request>) istream)
  "Deserializes a message object of type '<Dominant-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_org) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Dominant-request>)))
  "Returns string type for a service object of type '<Dominant-request>"
  "img_prc/DominantRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dominant-request)))
  "Returns string type for a service object of type 'Dominant-request"
  "img_prc/DominantRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Dominant-request>)))
  "Returns md5sum for a message object of type '<Dominant-request>"
  "822675abf3202697f33f9cb1bce7557d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Dominant-request)))
  "Returns md5sum for a message object of type 'Dominant-request"
  "822675abf3202697f33f9cb1bce7557d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Dominant-request>)))
  "Returns full string definition for message of type '<Dominant-request>"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Dominant-request)))
  "Returns full string definition for message of type 'Dominant-request"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Dominant-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_org))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Dominant-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Dominant-request
    (cl:cons ':img_org (img_org msg))
))
;//! \htmlinclude Dominant-response.msg.html

(cl:defclass <Dominant-response> (roslisp-msg-protocol:ros-message)
  ((img_dom
    :reader img_dom
    :initarg :img_dom
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Dominant-response (<Dominant-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Dominant-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Dominant-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Dominant-response> is deprecated: use img_prc-srv:Dominant-response instead.")))

(cl:ensure-generic-function 'img_dom-val :lambda-list '(m))
(cl:defmethod img_dom-val ((m <Dominant-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_dom-val is deprecated.  Use img_prc-srv:img_dom instead.")
  (img_dom m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Dominant-response>) ostream)
  "Serializes a message object of type '<Dominant-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_dom) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Dominant-response>) istream)
  "Deserializes a message object of type '<Dominant-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_dom) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Dominant-response>)))
  "Returns string type for a service object of type '<Dominant-response>"
  "img_prc/DominantResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dominant-response)))
  "Returns string type for a service object of type 'Dominant-response"
  "img_prc/DominantResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Dominant-response>)))
  "Returns md5sum for a message object of type '<Dominant-response>"
  "822675abf3202697f33f9cb1bce7557d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Dominant-response)))
  "Returns md5sum for a message object of type 'Dominant-response"
  "822675abf3202697f33f9cb1bce7557d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Dominant-response>)))
  "Returns full string definition for message of type '<Dominant-response>"
  (cl:format cl:nil "sensor_msgs/Image img_dom~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Dominant-response)))
  "Returns full string definition for message of type 'Dominant-response"
  (cl:format cl:nil "sensor_msgs/Image img_dom~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Dominant-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_dom))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Dominant-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Dominant-response
    (cl:cons ':img_dom (img_dom msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Dominant)))
  'Dominant-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Dominant)))
  'Dominant-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Dominant)))
  "Returns string type for a service object of type '<Dominant>"
  "img_prc/Dominant")