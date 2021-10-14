;; Auto-generated. Do not edit!


(when (boundp 'pracs::mysrv)
  (if (not (find-package "PRACS"))
    (make-package "PRACS"))
  (shadow 'mysrv (find-package "PRACS")))
(unless (find-package "PRACS::MYSRV")
  (make-package "PRACS::MYSRV"))
(unless (find-package "PRACS::MYSRVREQUEST")
  (make-package "PRACS::MYSRVREQUEST"))
(unless (find-package "PRACS::MYSRVRESPONSE")
  (make-package "PRACS::MYSRVRESPONSE"))

(in-package "ROS")





(defclass pracs::mysrvRequest
  :super ros::object
  :slots (_name ))

(defmethod pracs::mysrvRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pracs::mysrvResponse
  :super ros::object
  :slots (_age _weight ))

(defmethod pracs::mysrvResponse
  (:init
   (&key
    ((:age __age) 0)
    ((:weight __weight) 0.0)
    )
   (send-super :init)
   (setq _age (round __age))
   (setq _weight (float __weight))
   self)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; int64 _age
    8
    ;; float32 _weight
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _age
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _age (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _age) (= (length (_age . bv)) 2)) ;; bignum
              (write-long (ash (elt (_age . bv) 0) 0) s)
              (write-long (ash (elt (_age . bv) 1) -1) s))
             ((and (class _age) (= (length (_age . bv)) 1)) ;; big1
              (write-long (elt (_age . bv) 0) s)
              (write-long (if (>= _age 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _age s)(write-long (if (>= _age 0) 0 #xffffffff) s)))
     ;; float32 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _age
#+(or :alpha :irix6 :x86_64)
      (setf _age (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _age (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _weight
     (setq _weight (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass pracs::mysrv
  :super ros::object
  :slots ())

(setf (get pracs::mysrv :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get pracs::mysrv :datatype-) "pracs/mysrv")
(setf (get pracs::mysrv :request) pracs::mysrvRequest)
(setf (get pracs::mysrv :response) pracs::mysrvResponse)

(defmethod pracs::mysrvRequest
  (:response () (instance pracs::mysrvResponse :init)))

(setf (get pracs::mysrvRequest :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get pracs::mysrvRequest :datatype-) "pracs/mysrvRequest")
(setf (get pracs::mysrvRequest :definition-)
      "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading
#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw
#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile srv

#FIELD_TYPE VARIABLE Format

#REQUEST
#-------------
#RESPONSE


string name
---
int64 	age
float32 weight
")

(setf (get pracs::mysrvResponse :md5sum-) "043c37660891c202c07ae9cb667631f0")
(setf (get pracs::mysrvResponse :datatype-) "pracs/mysrvResponse")
(setf (get pracs::mysrvResponse :definition-)
      "#rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading
#rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw
#echo \"field type variable\" > srv/$(FILE.srv)       ##For Writing 

#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile srv

#FIELD_TYPE VARIABLE Format

#REQUEST
#-------------
#RESPONSE


string name
---
int64 	age
float32 weight
")



(provide :pracs/mysrv "043c37660891c202c07ae9cb667631f0")


