; Auto-generated. Do not edit!


(cl:in-package create_map-srv)


;//! \htmlinclude create_map_srv-request.msg.html

(cl:defclass <create_map_srv-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0)
   (a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0)
   (b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0)
   (teamcolor
    :reader teamcolor
    :initarg :teamcolor
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass create_map_srv-request (<create_map_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <create_map_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'create_map_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name create_map-srv:<create_map_srv-request> is deprecated: use create_map-srv:create_map_srv-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:x-val is deprecated.  Use create_map-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:y-val is deprecated.  Use create_map-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:theta-val is deprecated.  Use create_map-srv:theta instead.")
  (theta m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:a-val is deprecated.  Use create_map-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:b-val is deprecated.  Use create_map-srv:b instead.")
  (b m))

(cl:ensure-generic-function 'teamcolor-val :lambda-list '(m))
(cl:defmethod teamcolor-val ((m <create_map_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader create_map-srv:teamcolor-val is deprecated.  Use create_map-srv:teamcolor instead.")
  (teamcolor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <create_map_srv-request>) ostream)
  "Serializes a message object of type '<create_map_srv-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'teamcolor) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <create_map_srv-request>) istream)
  "Deserializes a message object of type '<create_map_srv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'teamcolor) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<create_map_srv-request>)))
  "Returns string type for a service object of type '<create_map_srv-request>"
  "create_map/create_map_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_map_srv-request)))
  "Returns string type for a service object of type 'create_map_srv-request"
  "create_map/create_map_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<create_map_srv-request>)))
  "Returns md5sum for a message object of type '<create_map_srv-request>"
  "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'create_map_srv-request)))
  "Returns md5sum for a message object of type 'create_map_srv-request"
  "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<create_map_srv-request>)))
  "Returns full string definition for message of type '<create_map_srv-request>"
  (cl:format cl:nil "float32                x~%float32                y~%float32                theta~%float32                a~%float32                b~%bool                   teamcolor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'create_map_srv-request)))
  "Returns full string definition for message of type 'create_map_srv-request"
  (cl:format cl:nil "float32                x~%float32                y~%float32                theta~%float32                a~%float32                b~%bool                   teamcolor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <create_map_srv-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <create_map_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'create_map_srv-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':teamcolor (teamcolor msg))
))
;//! \htmlinclude create_map_srv-response.msg.html

(cl:defclass <create_map_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass create_map_srv-response (<create_map_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <create_map_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'create_map_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name create_map-srv:<create_map_srv-response> is deprecated: use create_map-srv:create_map_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <create_map_srv-response>) ostream)
  "Serializes a message object of type '<create_map_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <create_map_srv-response>) istream)
  "Deserializes a message object of type '<create_map_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<create_map_srv-response>)))
  "Returns string type for a service object of type '<create_map_srv-response>"
  "create_map/create_map_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_map_srv-response)))
  "Returns string type for a service object of type 'create_map_srv-response"
  "create_map/create_map_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<create_map_srv-response>)))
  "Returns md5sum for a message object of type '<create_map_srv-response>"
  "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'create_map_srv-response)))
  "Returns md5sum for a message object of type 'create_map_srv-response"
  "ce11d8a36ed22138f3ccd3ee60b5ca4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<create_map_srv-response>)))
  "Returns full string definition for message of type '<create_map_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'create_map_srv-response)))
  "Returns full string definition for message of type 'create_map_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <create_map_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <create_map_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'create_map_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'create_map_srv)))
  'create_map_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'create_map_srv)))
  'create_map_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_map_srv)))
  "Returns string type for a service object of type '<create_map_srv>"
  "create_map/create_map_srv")