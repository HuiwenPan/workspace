; Auto-generated. Do not edit!


(cl:in-package test_srv-srv)


;//! \htmlinclude test_srv-request.msg.html

(cl:defclass <test_srv-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type cl:integer
    :initform 0))
)

(cl:defclass test_srv-request (<test_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_srv-srv:<test_srv-request> is deprecated: use test_srv-srv:test_srv-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <test_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_srv-srv:input-val is deprecated.  Use test_srv-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_srv-request>) ostream)
  "Serializes a message object of type '<test_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'input)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test_srv-request>) istream)
  "Deserializes a message object of type '<test_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test_srv-request>)))
  "Returns string type for a service object of type '<test_srv-request>"
  "test_srv/test_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv-request)))
  "Returns string type for a service object of type 'test_srv-request"
  "test_srv/test_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_srv-request>)))
  "Returns md5sum for a message object of type '<test_srv-request>"
  "9cc62145209219f185101e72e3ae5c65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_srv-request)))
  "Returns md5sum for a message object of type 'test_srv-request"
  "9cc62145209219f185101e72e3ae5c65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_srv-request>)))
  "Returns full string definition for message of type '<test_srv-request>"
  (cl:format cl:nil "~%int64       input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_srv-request)))
  "Returns full string definition for message of type 'test_srv-request"
  (cl:format cl:nil "~%int64       input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_srv-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'test_srv-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude test_srv-response.msg.html

(cl:defclass <test_srv-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type cl:integer
    :initform 0))
)

(cl:defclass test_srv-response (<test_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_srv-srv:<test_srv-response> is deprecated: use test_srv-srv:test_srv-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <test_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_srv-srv:output-val is deprecated.  Use test_srv-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_srv-response>) ostream)
  "Serializes a message object of type '<test_srv-response>"
  (cl:let* ((signed (cl:slot-value msg 'output)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test_srv-response>) istream)
  "Deserializes a message object of type '<test_srv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test_srv-response>)))
  "Returns string type for a service object of type '<test_srv-response>"
  "test_srv/test_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv-response)))
  "Returns string type for a service object of type 'test_srv-response"
  "test_srv/test_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_srv-response>)))
  "Returns md5sum for a message object of type '<test_srv-response>"
  "9cc62145209219f185101e72e3ae5c65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_srv-response)))
  "Returns md5sum for a message object of type 'test_srv-response"
  "9cc62145209219f185101e72e3ae5c65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_srv-response>)))
  "Returns full string definition for message of type '<test_srv-response>"
  (cl:format cl:nil "~%int64       output~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_srv-response)))
  "Returns full string definition for message of type 'test_srv-response"
  (cl:format cl:nil "~%int64       output~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_srv-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'test_srv-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'test_srv)))
  'test_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'test_srv)))
  'test_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv)))
  "Returns string type for a service object of type '<test_srv>"
  "test_srv/test_srv")