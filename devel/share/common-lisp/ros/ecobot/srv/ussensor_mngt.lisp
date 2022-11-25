; Auto-generated. Do not edit!


(cl:in-package ecobot-srv)


;//! \htmlinclude ussensor_mngt-request.msg.html

(cl:defclass <ussensor_mngt-request> (roslisp-msg-protocol:ros-message)
  ((sensor_id
    :reader sensor_id
    :initarg :sensor_id
    :type cl:fixnum
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ussensor_mngt-request (<ussensor_mngt-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ussensor_mngt-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ussensor_mngt-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ecobot-srv:<ussensor_mngt-request> is deprecated: use ecobot-srv:ussensor_mngt-request instead.")))

(cl:ensure-generic-function 'sensor_id-val :lambda-list '(m))
(cl:defmethod sensor_id-val ((m <ussensor_mngt-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ecobot-srv:sensor_id-val is deprecated.  Use ecobot-srv:sensor_id instead.")
  (sensor_id m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ussensor_mngt-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ecobot-srv:message-val is deprecated.  Use ecobot-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ussensor_mngt-request>) ostream)
  "Serializes a message object of type '<ussensor_mngt-request>"
  (cl:let* ((signed (cl:slot-value msg 'sensor_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ussensor_mngt-request>) istream)
  "Deserializes a message object of type '<ussensor_mngt-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ussensor_mngt-request>)))
  "Returns string type for a service object of type '<ussensor_mngt-request>"
  "ecobot/ussensor_mngtRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ussensor_mngt-request)))
  "Returns string type for a service object of type 'ussensor_mngt-request"
  "ecobot/ussensor_mngtRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ussensor_mngt-request>)))
  "Returns md5sum for a message object of type '<ussensor_mngt-request>"
  "4c3193c5a00d0932168fd4da30077568")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ussensor_mngt-request)))
  "Returns md5sum for a message object of type 'ussensor_mngt-request"
  "4c3193c5a00d0932168fd4da30077568")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ussensor_mngt-request>)))
  "Returns full string definition for message of type '<ussensor_mngt-request>"
  (cl:format cl:nil "# Mybot ultrasound sensors management message~%# ~%#  - message: should be either ACTIVATE, DEACTIVATE or STATUS~%#  - sensor_id: ID of the US sensor to activate or deactivate. ~%#  - response: a short message confirming the action of the service~%#  - deactivated_id: a list of US sensor IDS that have been deactivated~%~%int8 sensor_id~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ussensor_mngt-request)))
  "Returns full string definition for message of type 'ussensor_mngt-request"
  (cl:format cl:nil "# Mybot ultrasound sensors management message~%# ~%#  - message: should be either ACTIVATE, DEACTIVATE or STATUS~%#  - sensor_id: ID of the US sensor to activate or deactivate. ~%#  - response: a short message confirming the action of the service~%#  - deactivated_id: a list of US sensor IDS that have been deactivated~%~%int8 sensor_id~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ussensor_mngt-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ussensor_mngt-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ussensor_mngt-request
    (cl:cons ':sensor_id (sensor_id msg))
    (cl:cons ':message (message msg))
))
;//! \htmlinclude ussensor_mngt-response.msg.html

(cl:defclass <ussensor_mngt-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform "")
   (deactivated_id
    :reader deactivated_id
    :initarg :deactivated_id
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass ussensor_mngt-response (<ussensor_mngt-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ussensor_mngt-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ussensor_mngt-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ecobot-srv:<ussensor_mngt-response> is deprecated: use ecobot-srv:ussensor_mngt-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <ussensor_mngt-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ecobot-srv:response-val is deprecated.  Use ecobot-srv:response instead.")
  (response m))

(cl:ensure-generic-function 'deactivated_id-val :lambda-list '(m))
(cl:defmethod deactivated_id-val ((m <ussensor_mngt-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ecobot-srv:deactivated_id-val is deprecated.  Use ecobot-srv:deactivated_id instead.")
  (deactivated_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ussensor_mngt-response>) ostream)
  "Serializes a message object of type '<ussensor_mngt-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'deactivated_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'deactivated_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ussensor_mngt-response>) istream)
  "Deserializes a message object of type '<ussensor_mngt-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'deactivated_id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'deactivated_id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ussensor_mngt-response>)))
  "Returns string type for a service object of type '<ussensor_mngt-response>"
  "ecobot/ussensor_mngtResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ussensor_mngt-response)))
  "Returns string type for a service object of type 'ussensor_mngt-response"
  "ecobot/ussensor_mngtResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ussensor_mngt-response>)))
  "Returns md5sum for a message object of type '<ussensor_mngt-response>"
  "4c3193c5a00d0932168fd4da30077568")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ussensor_mngt-response)))
  "Returns md5sum for a message object of type 'ussensor_mngt-response"
  "4c3193c5a00d0932168fd4da30077568")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ussensor_mngt-response>)))
  "Returns full string definition for message of type '<ussensor_mngt-response>"
  (cl:format cl:nil "string response~%int8[] deactivated_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ussensor_mngt-response)))
  "Returns full string definition for message of type 'ussensor_mngt-response"
  (cl:format cl:nil "string response~%int8[] deactivated_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ussensor_mngt-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'deactivated_id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ussensor_mngt-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ussensor_mngt-response
    (cl:cons ':response (response msg))
    (cl:cons ':deactivated_id (deactivated_id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ussensor_mngt)))
  'ussensor_mngt-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ussensor_mngt)))
  'ussensor_mngt-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ussensor_mngt)))
  "Returns string type for a service object of type '<ussensor_mngt>"
  "ecobot/ussensor_mngt")