; Auto-generated. Do not edit!


(cl:in-package qt_connection-srv)


;//! \htmlinclude AbRatio-request.msg.html

(cl:defclass <AbRatio-request> (roslisp-msg-protocol:ros-message)
  ((ratio_req
    :reader ratio_req
    :initarg :ratio_req
    :type cl:float
    :initform 0.0))
)

(cl:defclass AbRatio-request (<AbRatio-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AbRatio-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AbRatio-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<AbRatio-request> is deprecated: use qt_connection-srv:AbRatio-request instead.")))

(cl:ensure-generic-function 'ratio_req-val :lambda-list '(m))
(cl:defmethod ratio_req-val ((m <AbRatio-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:ratio_req-val is deprecated.  Use qt_connection-srv:ratio_req instead.")
  (ratio_req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AbRatio-request>) ostream)
  "Serializes a message object of type '<AbRatio-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ratio_req))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AbRatio-request>) istream)
  "Deserializes a message object of type '<AbRatio-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ratio_req) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AbRatio-request>)))
  "Returns string type for a service object of type '<AbRatio-request>"
  "qt_connection/AbRatioRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AbRatio-request)))
  "Returns string type for a service object of type 'AbRatio-request"
  "qt_connection/AbRatioRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AbRatio-request>)))
  "Returns md5sum for a message object of type '<AbRatio-request>"
  "61c5d5487d6721936edcd8f3bcc6605b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AbRatio-request)))
  "Returns md5sum for a message object of type 'AbRatio-request"
  "61c5d5487d6721936edcd8f3bcc6605b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AbRatio-request>)))
  "Returns full string definition for message of type '<AbRatio-request>"
  (cl:format cl:nil "float64 ratio_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AbRatio-request)))
  "Returns full string definition for message of type 'AbRatio-request"
  (cl:format cl:nil "float64 ratio_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AbRatio-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AbRatio-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AbRatio-request
    (cl:cons ':ratio_req (ratio_req msg))
))
;//! \htmlinclude AbRatio-response.msg.html

(cl:defclass <AbRatio-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AbRatio-response (<AbRatio-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AbRatio-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AbRatio-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<AbRatio-response> is deprecated: use qt_connection-srv:AbRatio-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <AbRatio-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:finish-val is deprecated.  Use qt_connection-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AbRatio-response>) ostream)
  "Serializes a message object of type '<AbRatio-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AbRatio-response>) istream)
  "Deserializes a message object of type '<AbRatio-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AbRatio-response>)))
  "Returns string type for a service object of type '<AbRatio-response>"
  "qt_connection/AbRatioResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AbRatio-response)))
  "Returns string type for a service object of type 'AbRatio-response"
  "qt_connection/AbRatioResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AbRatio-response>)))
  "Returns md5sum for a message object of type '<AbRatio-response>"
  "61c5d5487d6721936edcd8f3bcc6605b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AbRatio-response)))
  "Returns md5sum for a message object of type 'AbRatio-response"
  "61c5d5487d6721936edcd8f3bcc6605b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AbRatio-response>)))
  "Returns full string definition for message of type '<AbRatio-response>"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AbRatio-response)))
  "Returns full string definition for message of type 'AbRatio-response"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AbRatio-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AbRatio-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AbRatio-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AbRatio)))
  'AbRatio-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AbRatio)))
  'AbRatio-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AbRatio)))
  "Returns string type for a service object of type '<AbRatio>"
  "qt_connection/AbRatio")