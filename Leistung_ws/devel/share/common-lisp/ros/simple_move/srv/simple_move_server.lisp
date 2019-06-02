; Auto-generated. Do not edit!


(cl:in-package simple_move-srv)


;//! \htmlinclude simple_move_server-request.msg.html

(cl:defclass <simple_move_server-request> (roslisp-msg-protocol:ros-message)
  ((Execute
    :reader Execute
    :initarg :Execute
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass simple_move_server-request (<simple_move_server-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_move_server-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_move_server-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simple_move-srv:<simple_move_server-request> is deprecated: use simple_move-srv:simple_move_server-request instead.")))

(cl:ensure-generic-function 'Execute-val :lambda-list '(m))
(cl:defmethod Execute-val ((m <simple_move_server-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_move-srv:Execute-val is deprecated.  Use simple_move-srv:Execute instead.")
  (Execute m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_move_server-request>) ostream)
  "Serializes a message object of type '<simple_move_server-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'Execute) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_move_server-request>) istream)
  "Deserializes a message object of type '<simple_move_server-request>"
    (cl:setf (cl:slot-value msg 'Execute) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_move_server-request>)))
  "Returns string type for a service object of type '<simple_move_server-request>"
  "simple_move/simple_move_serverRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_move_server-request)))
  "Returns string type for a service object of type 'simple_move_server-request"
  "simple_move/simple_move_serverRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_move_server-request>)))
  "Returns md5sum for a message object of type '<simple_move_server-request>"
  "05a3b190b2a3e8da10e3d0069fe74dbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_move_server-request)))
  "Returns md5sum for a message object of type 'simple_move_server-request"
  "05a3b190b2a3e8da10e3d0069fe74dbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_move_server-request>)))
  "Returns full string definition for message of type '<simple_move_server-request>"
  (cl:format cl:nil "bool  Execute~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_move_server-request)))
  "Returns full string definition for message of type 'simple_move_server-request"
  (cl:format cl:nil "bool  Execute~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_move_server-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_move_server-request>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_move_server-request
    (cl:cons ':Execute (Execute msg))
))
;//! \htmlinclude simple_move_server-response.msg.html

(cl:defclass <simple_move_server-response> (roslisp-msg-protocol:ros-message)
  ((final_pose
    :reader final_pose
    :initarg :final_pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass simple_move_server-response (<simple_move_server-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <simple_move_server-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'simple_move_server-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simple_move-srv:<simple_move_server-response> is deprecated: use simple_move-srv:simple_move_server-response instead.")))

(cl:ensure-generic-function 'final_pose-val :lambda-list '(m))
(cl:defmethod final_pose-val ((m <simple_move_server-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_move-srv:final_pose-val is deprecated.  Use simple_move-srv:final_pose instead.")
  (final_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <simple_move_server-response>) ostream)
  "Serializes a message object of type '<simple_move_server-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'final_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <simple_move_server-response>) istream)
  "Deserializes a message object of type '<simple_move_server-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'final_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<simple_move_server-response>)))
  "Returns string type for a service object of type '<simple_move_server-response>"
  "simple_move/simple_move_serverResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_move_server-response)))
  "Returns string type for a service object of type 'simple_move_server-response"
  "simple_move/simple_move_serverResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<simple_move_server-response>)))
  "Returns md5sum for a message object of type '<simple_move_server-response>"
  "05a3b190b2a3e8da10e3d0069fe74dbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'simple_move_server-response)))
  "Returns md5sum for a message object of type 'simple_move_server-response"
  "05a3b190b2a3e8da10e3d0069fe74dbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<simple_move_server-response>)))
  "Returns full string definition for message of type '<simple_move_server-response>"
  (cl:format cl:nil "geometry_msgs/Pose2D final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'simple_move_server-response)))
  "Returns full string definition for message of type 'simple_move_server-response"
  (cl:format cl:nil "geometry_msgs/Pose2D final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <simple_move_server-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'final_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <simple_move_server-response>))
  "Converts a ROS message object to a list"
  (cl:list 'simple_move_server-response
    (cl:cons ':final_pose (final_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'simple_move_server)))
  'simple_move_server-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'simple_move_server)))
  'simple_move_server-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'simple_move_server)))
  "Returns string type for a service object of type '<simple_move_server>"
  "simple_move/simple_move_server")