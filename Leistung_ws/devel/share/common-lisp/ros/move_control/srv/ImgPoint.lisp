; Auto-generated. Do not edit!


(cl:in-package move_control-srv)


;//! \htmlinclude ImgPoint-request.msg.html

(cl:defclass <ImgPoint-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ImgPoint-request (<ImgPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImgPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImgPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_control-srv:<ImgPoint-request> is deprecated: use move_control-srv:ImgPoint-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImgPoint-request>) ostream)
  "Serializes a message object of type '<ImgPoint-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImgPoint-request>) istream)
  "Deserializes a message object of type '<ImgPoint-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImgPoint-request>)))
  "Returns string type for a service object of type '<ImgPoint-request>"
  "move_control/ImgPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImgPoint-request)))
  "Returns string type for a service object of type 'ImgPoint-request"
  "move_control/ImgPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImgPoint-request>)))
  "Returns md5sum for a message object of type '<ImgPoint-request>"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImgPoint-request)))
  "Returns md5sum for a message object of type 'ImgPoint-request"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImgPoint-request>)))
  "Returns full string definition for message of type '<ImgPoint-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImgPoint-request)))
  "Returns full string definition for message of type 'ImgPoint-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImgPoint-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImgPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ImgPoint-request
))
;//! \htmlinclude ImgPoint-response.msg.html

(cl:defclass <ImgPoint-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ImgPoint-response (<ImgPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImgPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImgPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_control-srv:<ImgPoint-response> is deprecated: use move_control-srv:ImgPoint-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <ImgPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_control-srv:finish-val is deprecated.  Use move_control-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImgPoint-response>) ostream)
  "Serializes a message object of type '<ImgPoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImgPoint-response>) istream)
  "Deserializes a message object of type '<ImgPoint-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImgPoint-response>)))
  "Returns string type for a service object of type '<ImgPoint-response>"
  "move_control/ImgPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImgPoint-response)))
  "Returns string type for a service object of type 'ImgPoint-response"
  "move_control/ImgPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImgPoint-response>)))
  "Returns md5sum for a message object of type '<ImgPoint-response>"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImgPoint-response)))
  "Returns md5sum for a message object of type 'ImgPoint-response"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImgPoint-response>)))
  "Returns full string definition for message of type '<ImgPoint-response>"
  (cl:format cl:nil "bool finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImgPoint-response)))
  "Returns full string definition for message of type 'ImgPoint-response"
  (cl:format cl:nil "bool finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImgPoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImgPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ImgPoint-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ImgPoint)))
  'ImgPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ImgPoint)))
  'ImgPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImgPoint)))
  "Returns string type for a service object of type '<ImgPoint>"
  "move_control/ImgPoint")