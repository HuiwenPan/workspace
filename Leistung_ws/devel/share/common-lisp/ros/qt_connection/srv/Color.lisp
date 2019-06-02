; Auto-generated. Do not edit!


(cl:in-package qt_connection-srv)


;//! \htmlinclude Color-request.msg.html

(cl:defclass <Color-request> (roslisp-msg-protocol:ros-message)
  ((color_req
    :reader color_req
    :initarg :color_req
    :type cl:string
    :initform ""))
)

(cl:defclass Color-request (<Color-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Color-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Color-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<Color-request> is deprecated: use qt_connection-srv:Color-request instead.")))

(cl:ensure-generic-function 'color_req-val :lambda-list '(m))
(cl:defmethod color_req-val ((m <Color-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:color_req-val is deprecated.  Use qt_connection-srv:color_req instead.")
  (color_req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Color-request>) ostream)
  "Serializes a message object of type '<Color-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color_req))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color_req))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Color-request>) istream)
  "Deserializes a message object of type '<Color-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color_req) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color_req) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Color-request>)))
  "Returns string type for a service object of type '<Color-request>"
  "qt_connection/ColorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Color-request)))
  "Returns string type for a service object of type 'Color-request"
  "qt_connection/ColorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Color-request>)))
  "Returns md5sum for a message object of type '<Color-request>"
  "da328168331556f954624b109b527cef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Color-request)))
  "Returns md5sum for a message object of type 'Color-request"
  "da328168331556f954624b109b527cef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Color-request>)))
  "Returns full string definition for message of type '<Color-request>"
  (cl:format cl:nil "string color_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Color-request)))
  "Returns full string definition for message of type 'Color-request"
  (cl:format cl:nil "string color_req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Color-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color_req))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Color-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Color-request
    (cl:cons ':color_req (color_req msg))
))
;//! \htmlinclude Color-response.msg.html

(cl:defclass <Color-response> (roslisp-msg-protocol:ros-message)
  ((finish
    :reader finish
    :initarg :finish
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Color-response (<Color-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Color-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Color-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qt_connection-srv:<Color-response> is deprecated: use qt_connection-srv:Color-response instead.")))

(cl:ensure-generic-function 'finish-val :lambda-list '(m))
(cl:defmethod finish-val ((m <Color-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qt_connection-srv:finish-val is deprecated.  Use qt_connection-srv:finish instead.")
  (finish m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Color-response>) ostream)
  "Serializes a message object of type '<Color-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Color-response>) istream)
  "Deserializes a message object of type '<Color-response>"
    (cl:setf (cl:slot-value msg 'finish) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Color-response>)))
  "Returns string type for a service object of type '<Color-response>"
  "qt_connection/ColorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Color-response)))
  "Returns string type for a service object of type 'Color-response"
  "qt_connection/ColorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Color-response>)))
  "Returns md5sum for a message object of type '<Color-response>"
  "da328168331556f954624b109b527cef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Color-response)))
  "Returns md5sum for a message object of type 'Color-response"
  "da328168331556f954624b109b527cef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Color-response>)))
  "Returns full string definition for message of type '<Color-response>"
  (cl:format cl:nil "bool finish~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Color-response)))
  "Returns full string definition for message of type 'Color-response"
  (cl:format cl:nil "bool finish~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Color-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Color-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Color-response
    (cl:cons ':finish (finish msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Color)))
  'Color-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Color)))
  'Color-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Color)))
  "Returns string type for a service object of type '<Color>"
  "qt_connection/Color")