; Auto-generated. Do not edit!


(cl:in-package auto_flight-msg)


;//! \htmlinclude ncrl_link.msg.html

(cl:defclass <ncrl_link> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform "")
   (aux_info
    :reader aux_info
    :initarg :aux_info
    :type cl:string
    :initform "")
   (data1
    :reader data1
    :initarg :data1
    :type cl:float
    :initform 0.0)
   (data2
    :reader data2
    :initarg :data2
    :type cl:float
    :initform 0.0)
   (data3
    :reader data3
    :initarg :data3
    :type cl:float
    :initform 0.0))
)

(cl:defclass ncrl_link (<ncrl_link>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ncrl_link>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ncrl_link)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name auto_flight-msg:<ncrl_link> is deprecated: use auto_flight-msg:ncrl_link instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ncrl_link>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auto_flight-msg:mode-val is deprecated.  Use auto_flight-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'aux_info-val :lambda-list '(m))
(cl:defmethod aux_info-val ((m <ncrl_link>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auto_flight-msg:aux_info-val is deprecated.  Use auto_flight-msg:aux_info instead.")
  (aux_info m))

(cl:ensure-generic-function 'data1-val :lambda-list '(m))
(cl:defmethod data1-val ((m <ncrl_link>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auto_flight-msg:data1-val is deprecated.  Use auto_flight-msg:data1 instead.")
  (data1 m))

(cl:ensure-generic-function 'data2-val :lambda-list '(m))
(cl:defmethod data2-val ((m <ncrl_link>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auto_flight-msg:data2-val is deprecated.  Use auto_flight-msg:data2 instead.")
  (data2 m))

(cl:ensure-generic-function 'data3-val :lambda-list '(m))
(cl:defmethod data3-val ((m <ncrl_link>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auto_flight-msg:data3-val is deprecated.  Use auto_flight-msg:data3 instead.")
  (data3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ncrl_link>) ostream)
  "Serializes a message object of type '<ncrl_link>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'aux_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'aux_info))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ncrl_link>) istream)
  "Deserializes a message object of type '<ncrl_link>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'aux_info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'aux_info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ncrl_link>)))
  "Returns string type for a message object of type '<ncrl_link>"
  "auto_flight/ncrl_link")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ncrl_link)))
  "Returns string type for a message object of type 'ncrl_link"
  "auto_flight/ncrl_link")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ncrl_link>)))
  "Returns md5sum for a message object of type '<ncrl_link>"
  "07c672e9218196d466a602767f407d91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ncrl_link)))
  "Returns md5sum for a message object of type 'ncrl_link"
  "07c672e9218196d466a602767f407d91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ncrl_link>)))
  "Returns full string definition for message of type '<ncrl_link>"
  (cl:format cl:nil "string mode~%string aux_info~%float32 data1~%float32 data2~%float32 data3~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ncrl_link)))
  "Returns full string definition for message of type 'ncrl_link"
  (cl:format cl:nil "string mode~%string aux_info~%float32 data1~%float32 data2~%float32 data3~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ncrl_link>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mode))
     4 (cl:length (cl:slot-value msg 'aux_info))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ncrl_link>))
  "Converts a ROS message object to a list"
  (cl:list 'ncrl_link
    (cl:cons ':mode (mode msg))
    (cl:cons ':aux_info (aux_info msg))
    (cl:cons ':data1 (data1 msg))
    (cl:cons ':data2 (data2 msg))
    (cl:cons ':data3 (data3 msg))
))
