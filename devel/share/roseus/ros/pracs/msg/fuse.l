;; Auto-generated. Do not edit!


(when (boundp 'pracs::fuse)
  (if (not (find-package "PRACS"))
    (make-package "PRACS"))
  (shadow 'fuse (find-package "PRACS")))
(unless (find-package "PRACS::FUSE")
  (make-package "PRACS::FUSE"))

(in-package "ROS")
;;//! \htmlinclude fuse.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pracs::fuse
  :super ros::object
  :slots (_header _x _y _z _roll _yaw _pitch _ranges ))

(defmethod pracs::fuse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y __y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:z __z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:roll __roll) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:yaw __yaw) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pitch __pitch) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ranges __ranges) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _roll __roll)
   (setq _yaw __yaw)
   (setq _pitch __pitch)
   (setq _ranges __ranges)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:ranges
   (&optional __ranges)
   (if __ranges (setq _ranges __ranges)) _ranges)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _x
    (* 8    (length _x)) 4
    ;; float64[] _y
    (* 8    (length _y)) 4
    ;; float64[] _z
    (* 8    (length _z)) 4
    ;; float64[] _roll
    (* 8    (length _roll)) 4
    ;; float64[] _yaw
    (* 8    (length _yaw)) 4
    ;; float64[] _pitch
    (* 8    (length _pitch)) 4
    ;; float32[] _ranges
    (* 4    (length _ranges)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _x
     (write-long (length _x) s)
     (dotimes (i (length _x))
       (sys::poke (elt _x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _y
     (write-long (length _y) s)
     (dotimes (i (length _y))
       (sys::poke (elt _y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _z
     (write-long (length _z) s)
     (dotimes (i (length _z))
       (sys::poke (elt _z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _roll
     (write-long (length _roll) s)
     (dotimes (i (length _roll))
       (sys::poke (elt _roll i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _yaw
     (write-long (length _yaw) s)
     (dotimes (i (length _yaw))
       (sys::poke (elt _yaw i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pitch
     (write-long (length _pitch) s)
     (dotimes (i (length _pitch))
       (sys::poke (elt _pitch i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float32[] _ranges
     (write-long (length _ranges) s)
     (dotimes (i (length _ranges))
       (sys::poke (elt _ranges i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _roll
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _roll (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _roll i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _yaw
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _yaw (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _yaw i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pitch
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pitch (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pitch i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float32[] _ranges
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ranges (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ranges i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get pracs::fuse :md5sum-) "928b9f2c3ffde350158f693508e3c987")
(setf (get pracs::fuse :datatype-) "pracs/fuse")
(setf (get pracs::fuse :definition-)
      "#class $(file_name):
#          type file_name.attr1 = var_name1
#		   type file_name.attr2 = var_name2


#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg
#FIELD_TYPE VARIABLE Format

Header header		#seq, time_stamp, id
float64[] x
float64[] y
float64[] z

float64[] roll
float64[] yaw
float64[] pitch

float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :pracs/fuse "928b9f2c3ffde350158f693508e3c987")


