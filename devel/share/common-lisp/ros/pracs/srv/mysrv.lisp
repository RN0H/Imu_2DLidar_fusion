; Auto-generated. Do not edit!


(cl:in-package pracs-srv)


;//! \htmlinclude mysrv-request.msg.html

(cl:defclass <mysrv-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass mysrv-request (<mysrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mysrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mysrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pracs-srv:<mysrv-request> is deprecated: use pracs-srv:mysrv-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <mysrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pracs-srv:name-val is deprecated.  Use pracs-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mysrv-request>) ostream)
  "Serializes a message object of type '<mysrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mysrv-request>) istream)
  "Deserializes a message object of type '<mysrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mysrv-request>)))
  "Returns string type for a service object of type '<mysrv-request>"
  "pracs/mysrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mysrv-request)))
  "Returns string type for a service object of type 'mysrv-request"
  "pracs/mysrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mysrv-request>)))
  "Returns md5sum for a message object of type '<mysrv-request>"
  "043c37660891c202c07ae9cb667631f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mysrv-request)))
  "Returns md5sum for a message object of type 'mysrv-request"
  "043c37660891c202c07ae9cb667631f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mysrv-request>)))
  "Returns full string definition for message of type '<mysrv-request>"
  (cl:format cl:nil "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading~%#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw~%#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing ~%~%#AFTER EDITING, cd ~~/catkin_ws; catkin_make #compile srv~%~%#FIELD_TYPE VARIABLE Format~%~%#REQUEST~%#-------------~%#RESPONSE~%~%~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mysrv-request)))
  "Returns full string definition for message of type 'mysrv-request"
  (cl:format cl:nil "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading~%#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw~%#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing ~%~%#AFTER EDITING, cd ~~/catkin_ws; catkin_make #compile srv~%~%#FIELD_TYPE VARIABLE Format~%~%#REQUEST~%#-------------~%#RESPONSE~%~%~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mysrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mysrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'mysrv-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude mysrv-response.msg.html

(cl:defclass <mysrv-response> (roslisp-msg-protocol:ros-message)
  ((age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0)
   (weight
    :reader weight
    :initarg :weight
    :type cl:float
    :initform 0.0))
)

(cl:defclass mysrv-response (<mysrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mysrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mysrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pracs-srv:<mysrv-response> is deprecated: use pracs-srv:mysrv-response instead.")))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <mysrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pracs-srv:age-val is deprecated.  Use pracs-srv:age instead.")
  (age m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <mysrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pracs-srv:weight-val is deprecated.  Use pracs-srv:weight instead.")
  (weight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mysrv-response>) ostream)
  "Serializes a message object of type '<mysrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'age)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'weight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mysrv-response>) istream)
  "Deserializes a message object of type '<mysrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'age) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'weight) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mysrv-response>)))
  "Returns string type for a service object of type '<mysrv-response>"
  "pracs/mysrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mysrv-response)))
  "Returns string type for a service object of type 'mysrv-response"
  "pracs/mysrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mysrv-response>)))
  "Returns md5sum for a message object of type '<mysrv-response>"
  "043c37660891c202c07ae9cb667631f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mysrv-response)))
  "Returns md5sum for a message object of type 'mysrv-response"
  "043c37660891c202c07ae9cb667631f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mysrv-response>)))
  "Returns full string definition for message of type '<mysrv-response>"
  (cl:format cl:nil "int64 	age~%float32 weight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mysrv-response)))
  "Returns full string definition for message of type 'mysrv-response"
  (cl:format cl:nil "int64 	age~%float32 weight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mysrv-response>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mysrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'mysrv-response
    (cl:cons ':age (age msg))
    (cl:cons ':weight (weight msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'mysrv)))
  'mysrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'mysrv)))
  'mysrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mysrv)))
  "Returns string type for a service object of type '<mysrv>"
  "pracs/mysrv")