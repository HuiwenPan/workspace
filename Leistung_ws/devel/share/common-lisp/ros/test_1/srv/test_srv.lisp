; Auto-generated. Do not edit!


(cl:in-package test_1-srv)


;//! \htmlinclude test_srv-request.msg.html

(cl:defclass <test_srv-request> (roslisp-msg-protocol:ros-message)
  ((input_text
    :reader input_text
    :initarg :input_text
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (input
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_1-srv:<test_srv-request> is deprecated: use test_1-srv:test_srv-request instead.")))

(cl:ensure-generic-function 'input_text-val :lambda-list '(m))
(cl:defmethod input_text-val ((m <test_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_1-srv:input_text-val is deprecated.  Use test_1-srv:input_text instead.")
  (input_text m))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <test_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_1-srv:input-val is deprecated.  Use test_1-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_srv-request>) ostream)
  "Serializes a message object of type '<test_srv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'input_text) ostream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'input_text) istream)
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
  "test_1/test_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv-request)))
  "Returns string type for a service object of type 'test_srv-request"
  "test_1/test_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_srv-request>)))
  "Returns md5sum for a message object of type '<test_srv-request>"
  "53244230a18aeabb17bd81ddb3a8f9e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_srv-request)))
  "Returns md5sum for a message object of type 'test_srv-request"
  "53244230a18aeabb17bd81ddb3a8f9e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_srv-request>)))
  "Returns full string definition for message of type '<test_srv-request>"
  (cl:format cl:nil "std_msgs/String input_text~%int64       input~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_srv-request)))
  "Returns full string definition for message of type 'test_srv-request"
  (cl:format cl:nil "std_msgs/String input_text~%int64       input~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_srv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'input_text))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'test_srv-request
    (cl:cons ':input_text (input_text msg))
    (cl:cons ':input (input msg))
))
;//! \htmlinclude test_srv-response.msg.html

(cl:defclass <test_srv-response> (roslisp-msg-protocol:ros-message)
  ((output_text
    :reader output_text
    :initarg :output_text
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (output
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_1-srv:<test_srv-response> is deprecated: use test_1-srv:test_srv-response instead.")))

(cl:ensure-generic-function 'output_text-val :lambda-list '(m))
(cl:defmethod output_text-val ((m <test_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_1-srv:output_text-val is deprecated.  Use test_1-srv:output_text instead.")
  (output_text m))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <test_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_1-srv:output-val is deprecated.  Use test_1-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_srv-response>) ostream)
  "Serializes a message object of type '<test_srv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'output_text) ostream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'output_text) istream)
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
  "test_1/test_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv-response)))
  "Returns string type for a service object of type 'test_srv-response"
  "test_1/test_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_srv-response>)))
  "Returns md5sum for a message object of type '<test_srv-response>"
  "53244230a18aeabb17bd81ddb3a8f9e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_srv-response)))
  "Returns md5sum for a message object of type 'test_srv-response"
  "53244230a18aeabb17bd81ddb3a8f9e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_srv-response>)))
  "Returns full string definition for message of type '<test_srv-response>"
  (cl:format cl:nil "std_msgs/String output_text~%int64       output~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_srv-response)))
  "Returns full string definition for message of type 'test_srv-response"
  (cl:format cl:nil "std_msgs/String output_text~%int64       output~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_srv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'output_text))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'test_srv-response
    (cl:cons ':output_text (output_text msg))
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'test_srv)))
  'test_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'test_srv)))
  'test_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_srv)))
  "Returns string type for a service object of type '<test_srv>"
  "test_1/test_srv")