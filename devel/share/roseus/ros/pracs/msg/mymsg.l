;; Auto-generated. Do not edit!


(when (boundp 'pracs::mymsg)
  (if (not (find-package "PRACS"))
    (make-package "PRACS"))
  (shadow 'mymsg (find-package "PRACS")))
(unless (find-package "PRACS::MYMSG")
  (make-package "PRACS::MYMSG"))

(in-package "ROS")
;;//! \htmlinclude mymsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pracs::mymsg
  :super ros::object
  :slots (_header _x _y _z _roll _yaw _pitch ))

(defmethod pracs::mymsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
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
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _roll
    8
    ;; float64 _yaw
    8
    ;; float64 _pitch
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pracs::mymsg :md5sum-) "16c1c4a24987be81e2e2fab0f60abc35")
(setf (get pracs::mymsg :datatype-) "pracs/mymsg")
(setf (get pracs::mymsg :definition-)
      "#class $(file_name):
#          type file_name.attr1 = var_name1
#		   type file_name.attr2 = var_name2


#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg
#FIELD_TYPE VARIABLE Format

Header header		#seq, time_stamp, id
float64 x
float64 y
float64 z

float64 roll
float64 yaw
float64 pitch


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



(provide :pracs/mymsg "16c1c4a24987be81e2e2fab0f60abc35")


