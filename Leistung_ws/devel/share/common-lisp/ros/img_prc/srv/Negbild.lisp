; Auto-generated. Do not edit!


(cl:in-package img_prc-srv)


;//! \htmlinclude Negbild-request.msg.html

(cl:defclass <Negbild-request> (roslisp-msg-protocol:ros-message)
  ((img_org
    :reader img_org
    :initarg :img_org
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Negbild-request (<Negbild-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Negbild-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Negbild-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Negbild-request> is deprecated: use img_prc-srv:Negbild-request instead.")))

(cl:ensure-generic-function 'img_org-val :lambda-list '(m))
(cl:defmethod img_org-val ((m <Negbild-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_org-val is deprecated.  Use img_prc-srv:img_org instead.")
  (img_org m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Negbild-request>) ostream)
  "Serializes a message object of type '<Negbild-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_org) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Negbild-request>) istream)
  "Deserializes a message object of type '<Negbild-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_org) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Negbild-request>)))
  "Returns string type for a service object of type '<Negbild-request>"
  "img_prc/NegbildRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Negbild-request)))
  "Returns string type for a service object of type 'Negbild-request"
  "img_prc/NegbildRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Negbild-request>)))
  "Returns md5sum for a message object of type '<Negbild-request>"
  "862fde1277655a70d749518de66ecb5b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Negbild-request)))
  "Returns md5sum for a message object of type 'Negbild-request"
  "862fde1277655a70d749518de66ecb5b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Negbild-request>)))
  "Returns full string definition for message of type '<Negbild-request>"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Negbild-request)))
  "Returns full string definition for message of type 'Negbild-request"
  (cl:format cl:nil "sensor_msgs/Image img_org~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Negbild-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_org))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Negbild-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Negbild-request
    (cl:cons ':img_org (img_org msg))
))
;//! \htmlinclude Negbild-response.msg.html

(cl:defclass <Negbild-response> (roslisp-msg-protocol:ros-message)
  ((img_neg
    :reader img_neg
    :initarg :img_neg
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Negbild-response (<Negbild-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Negbild-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Negbild-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name img_prc-srv:<Negbild-response> is deprecated: use img_prc-srv:Negbild-response instead.")))

(cl:ensure-generic-function 'img_neg-val :lambda-list '(m))
(cl:defmethod img_neg-val ((m <Negbild-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader img_prc-srv:img_neg-val is deprecated.  Use img_prc-srv:img_neg instead.")
  (img_neg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Negbild-response>) ostream)
  "Serializes a message object of type '<Negbild-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img_neg) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Negbild-response>) istream)
  "Deserializes a message object of type '<Negbild-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img_neg) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Negbild-response>)))
  "Returns string type for a service object of type '<Negbild-response>"
  "img_prc/NegbildResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Negbild-response)))
  "Returns string type for a service object of type 'Negbild-response"
  "img_prc/NegbildResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Negbild-response>)))
  "Returns md5sum for a message object of type '<Negbild-response>"
  "862fde1277655a70d749518de66ecb5b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Negbild-response)))
  "Returns md5sum for a message object of type 'Negbild-response"
  "862fde1277655a70d749518de66ecb5b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Negbild-response>)))
  "Returns full string definition for message of type '<Negbild-response>"
  (cl:format cl:nil "sensor_msgs/Image img_neg~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Negbild-response)))
  "Returns full string definition for message of type 'Negbild-response"
  (cl:format cl:nil "sensor_msgs/Image img_neg~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Negbild-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img_neg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Negbild-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Negbild-response
    (cl:cons ':img_neg (img_neg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Negbild)))
  'Negbild-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Negbild)))
  'Negbild-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Negbild)))
  "Returns string type for a service object of type '<Negbild>"
  "img_prc/Negbild")