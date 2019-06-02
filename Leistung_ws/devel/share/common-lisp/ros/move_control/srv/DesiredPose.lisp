; Auto-generated. Do not edit!


(cl:in-package move_control-srv)


;//! \htmlinclude DesiredPose-request.msg.html

(cl:defclass <DesiredPose-request> (roslisp-msg-protocol:ros-message)
  ((x_d
    :reader x_d
    :initarg :x_d
    :type cl:float
    :initform 0.0)
   (y_d
    :reader y_d
    :initarg :y_d
    :type cl:float
    :initform 0.0)
   (theta_d
    :reader theta_d
    :initarg :theta_d
    :type cl:float
    :initform 0.0))
)

(cl:defclass DesiredPose-request (<DesiredPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesiredPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesiredPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_control-srv:<DesiredPose-request> is deprecated: use move_control-srv:DesiredPose-request instead.")))

(cl:ensure-generic-function 'x_d-val :lambda-list '(m))
(cl:defmethod x_d-val ((m <DesiredPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_control-srv:x_d-val is deprecated.  Use move_control-srv:x_d instead.")
  (x_d m))

(cl:ensure-generic-function 'y_d-val :lambda-list '(m))
(cl:defmethod y_d-val ((m <DesiredPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_control-srv:y_d-val is deprecated.  Use move_control-srv:y_d instead.")
  (y_d m))

(cl:ensure-generic-function 'theta_d-val :lambda-list '(m))
(cl:defmethod theta_d-val ((m <DesiredPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_control-srv:theta_d-val is deprecated.  Use move_control-srv:theta_d instead.")
  (theta_d m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesiredPose-request>) ostream)
  "Serializes a message object of type '<DesiredPose-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'theta_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesiredPose-request>) istream)
  "Deserializes a message object of type '<DesiredPose-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_d) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_d) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_d) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesiredPose-request>)))
  "Returns string type for a service object of type '<DesiredPose-request>"
  "move_control/DesiredPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredPose-request)))
  "Returns string type for a service object of type 'DesiredPose-request"
  "move_control/DesiredPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesiredPose-request>)))
  "Returns md5sum for a message object of type '<DesiredPose-request>"
  "0a875362d8b56b739c21258a4954ddeb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesiredPose-request)))
  "Returns md5sum for a message object of type 'DesiredPose-request"
  "0a875362d8b56b739c21258a4954ddeb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesiredPose-request>)))
  "Returns full string definition for message of type '<DesiredPose-request>"
  (cl:format cl:nil "float64 x_d~%float64 y_d~%float64 theta_d~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesiredPose-request)))
  "Returns full string definition for message of type 'DesiredPose-request"
  (cl:format cl:nil "float64 x_d~%float64 y_d~%float64 theta_d~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesiredPose-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesiredPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DesiredPose-request
    (cl:cons ':x_d (x_d msg))
    (cl:cons ':y_d (y_d msg))
    (cl:cons ':theta_d (theta_d msg))
))
;//! \htmlinclude DesiredPose-response.msg.html

(cl:defclass <DesiredPose-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DesiredPose-response (<DesiredPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesiredPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesiredPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_control-srv:<DesiredPose-response> is deprecated: use move_control-srv:DesiredPose-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <DesiredPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_control-srv:finish-val is deprecated.  Use move_control-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesiredPose-response>) ostream)
  "Serializes a message object of type '<DesiredPose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesiredPose-response>) istream)
  "Deserializes a message object of type '<DesiredPose-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesiredPose-response>)))
  "Returns string type for a service object of type '<DesiredPose-response>"
  "move_control/DesiredPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredPose-response)))
  "Returns string type for a service object of type 'DesiredPose-response"
  "move_control/DesiredPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesiredPose-response>)))
  "Returns md5sum for a message object of type '<DesiredPose-response>"
  "0a875362d8b56b739c21258a4954ddeb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesiredPose-response)))
  "Returns md5sum for a message object of type 'DesiredPose-response"
  "0a875362d8b56b739c21258a4954ddeb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesiredPose-response>)))
  "Returns full string definition for message of type '<DesiredPose-response>"
  (cl:format cl:nil "bool finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesiredPose-response)))
  "Returns full string definition for message of type 'DesiredPose-response"
  (cl:format cl:nil "bool finish~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesiredPose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesiredPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DesiredPose-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DesiredPose)))
  'DesiredPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DesiredPose)))
  'DesiredPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredPose)))
  "Returns string type for a service object of type '<DesiredPose>"
  "move_control/DesiredPose")