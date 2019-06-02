; Auto-generated. Do not edit!


(cl:in-package qt_connection-srv)


;//! \htmlinclude EgoPos-request.msg.html

(cl:defclass <EgoPos-request> (roslisp-msg-protocol:ros-message)
  ((x_req
    :reader x_req
    :initarg :x_req
    :type cl:float
    :initform 0.0)
   (y_req
    :reader y_req
    :initarg :y_req
    :type cl:float
    :initform 0.0))
)

(cl:defclass EgoPos-request (<EgoPos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EgoPos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EgoPos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<EgoPos-request> is deprecated: use qt_connection-srv:EgoPos-request instead.")))

(cl:ensure-generic-function 'x_req-val :lambda-list '(m))
(cl:defmethod x_req-val ((m <EgoPos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:x_req-val is deprecated.  Use qt_connection-srv:x_req instead.")
  (x_req m))

(cl:ensure-generic-function 'y_req-val :lambda-list '(m))
(cl:defmethod y_req-val ((m <EgoPos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:y_req-val is deprecated.  Use qt_connection-srv:y_req instead.")
  (y_req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EgoPos-request>) ostream)
  "Serializes a message object of type '<EgoPos-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_req))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y_req))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EgoPos-request>) istream)
  "Deserializes a message object of type '<EgoPos-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_req) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_req) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EgoPos-request>)))
  "Returns string type for a service object of type '<EgoPos-request>"
  "qt_connection/EgoPosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoPos-request)))
  "Returns string type for a service object of type 'EgoPos-request"
  "qt_connection/EgoPosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EgoPos-request>)))
  "Returns md5sum for a message object of type '<EgoPos-request>"
  "c0407d004a1efa7e56d28b80616e7c3e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EgoPos-request)))
  "Returns md5sum for a message object of type 'EgoPos-request"
  "c0407d004a1efa7e56d28b80616e7c3e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EgoPos-request>)))
  "Returns full string definition for message of type '<EgoPos-request>"
  (cl:format cl:nil "float64 x_req~%float64 y_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EgoPos-request)))
  "Returns full string definition for message of type 'EgoPos-request"
  (cl:format cl:nil "float64 x_req~%float64 y_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EgoPos-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EgoPos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'EgoPos-request
    (cl:cons ':x_req (x_req msg))
    (cl:cons ':y_req (y_req msg))
))
;//! \htmlinclude EgoPos-response.msg.html

(cl:defclass <EgoPos-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EgoPos-response (<EgoPos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EgoPos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EgoPos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<EgoPos-response> is deprecated: use qt_connection-srv:EgoPos-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <EgoPos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:finish-val is deprecated.  Use qt_connection-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EgoPos-response>) ostream)
  "Serializes a message object of type '<EgoPos-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EgoPos-response>) istream)
  "Deserializes a message object of type '<EgoPos-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EgoPos-response>)))
  "Returns string type for a service object of type '<EgoPos-response>"
  "qt_connection/EgoPosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoPos-response)))
  "Returns string type for a service object of type 'EgoPos-response"
  "qt_connection/EgoPosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EgoPos-response>)))
  "Returns md5sum for a message object of type '<EgoPos-response>"
  "c0407d004a1efa7e56d28b80616e7c3e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EgoPos-response)))
  "Returns md5sum for a message object of type 'EgoPos-response"
  "c0407d004a1efa7e56d28b80616e7c3e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EgoPos-response>)))
  "Returns full string definition for message of type '<EgoPos-response>"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EgoPos-response)))
  "Returns full string definition for message of type 'EgoPos-response"
  (cl:format cl:nil "bool finish~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EgoPos-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EgoPos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'EgoPos-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'EgoPos)))
  'EgoPos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'EgoPos)))
  'EgoPos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoPos)))
  "Returns string type for a service object of type '<EgoPos>"
  "qt_connection/EgoPos")