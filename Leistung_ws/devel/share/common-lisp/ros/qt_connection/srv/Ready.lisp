; Auto-generated. Do not edit!


(cl:in-package qt_connection-srv)


;//! \htmlinclude Ready-request.msg.html

(cl:defclass <Ready-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Ready-request (<Ready-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ready-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ready-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<Ready-request> is deprecated: use qt_connection-srv:Ready-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ready-request>) ostream)
  "Serializes a message object of type '<Ready-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ready-request>) istream)
  "Deserializes a message object of type '<Ready-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ready-request>)))
  "Returns string type for a service object of type '<Ready-request>"
  "qt_connection/ReadyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ready-request)))
  "Returns string type for a service object of type 'Ready-request"
  "qt_connection/ReadyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ready-request>)))
  "Returns md5sum for a message object of type '<Ready-request>"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ready-request)))
  "Returns md5sum for a message object of type 'Ready-request"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ready-request>)))
  "Returns full string definition for message of type '<Ready-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ready-request)))
  "Returns full string definition for message of type 'Ready-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ready-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ready-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Ready-request
))
;//! \htmlinclude Ready-response.msg.html

(cl:defclass <Ready-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Ready-response (<Ready-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ready-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ready-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<Ready-response> is deprecated: use qt_connection-srv:Ready-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <Ready-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:finish-val is deprecated.  Use qt_connection-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ready-response>) ostream)
  "Serializes a message object of type '<Ready-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ready-response>) istream)
  "Deserializes a message object of type '<Ready-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ready-response>)))
  "Returns string type for a service object of type '<Ready-response>"
  "qt_connection/ReadyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ready-response)))
  "Returns string type for a service object of type 'Ready-response"
  "qt_connection/ReadyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ready-response>)))
  "Returns md5sum for a message object of type '<Ready-response>"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ready-response)))
  "Returns md5sum for a message object of type 'Ready-response"
  "474a58dbb494a45bb1ca99544cd64e45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ready-response>)))
  "Returns full string definition for message of type '<Ready-response>"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ready-response)))
  "Returns full string definition for message of type 'Ready-response"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ready-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ready-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Ready-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Ready)))
  'Ready-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Ready)))
  'Ready-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ready)))
  "Returns string type for a service object of type '<Ready>"
  "qt_connection/Ready")