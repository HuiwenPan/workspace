;; Auto-generated. Do not edit!


(when (boundp 'test_1::test_srv)
  (if (not (find-package "TEST_1"))
    (make-package "TEST_1"))
  (shadow 'test_srv (find-package "TEST_1")))
(unless (find-package "TEST_1::TEST_SRV")
  (make-package "TEST_1::TEST_SRV"))
(unless (find-package "TEST_1::TEST_SRVREQUEST")
  (make-package "TEST_1::TEST_SRVREQUEST"))
(unless (find-package "TEST_1::TEST_SRVRESPONSE")
  (make-package "TEST_1::TEST_SRVRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass test_1::test_srvRequest
  :super ros::object
  :slots (_input_text _input ))

(defmethod test_1::test_srvRequest
  (:init
   (&key
    ((:input_text __input_text) (instance std_msgs::String :init))
    ((:input __input) 0)
    )
   (send-super :init)
   (setq _input_text __input_text)
   (setq _input (round __input))
   self)
  (:input_text
   (&rest __input_text)
   (if (keywordp (car __input_text))
       (send* _input_text __input_text)
     (progn
       (if __input_text (setq _input_text (car __input_text)))
       _input_text)))
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _input_text
    (send _input_text :serialization-length)
    ;; int64 _input
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _input_text
       (send _input_text :serialize s)
     ;; int64 _input
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _input (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _input) (= (length (_input . bv)) 2)) ;; bignum
              (write-long (ash (elt (_input . bv) 0) 0) s)
              (write-long (ash (elt (_input . bv) 1) -1) s))
             ((and (class _input) (= (length (_input . bv)) 1)) ;; big1
              (write-long (elt (_input . bv) 0) s)
              (write-long (if (>= _input 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _input s)(write-long (if (>= _input 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _input_text
     (send _input_text :deserialize buf ptr-) (incf ptr- (send _input_text :serialization-length))
   ;; int64 _input
#+(or :alpha :irix6 :x86_64)
      (setf _input (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _input (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass test_1::test_srvResponse
  :super ros::object
  :slots (_output_text _output ))

(defmethod test_1::test_srvResponse
  (:init
   (&key
    ((:output_text __output_text) (instance std_msgs::String :init))
    ((:output __output) 0)
    )
   (send-super :init)
   (setq _output_text __output_text)
   (setq _output (round __output))
   self)
  (:output_text
   (&rest __output_text)
   (if (keywordp (car __output_text))
       (send* _output_text __output_text)
     (progn
       (if __output_text (setq _output_text (car __output_text)))
       _output_text)))
  (:output
   (&optional __output)
   (if __output (setq _output __output)) _output)
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _output_text
    (send _output_text :serialization-length)
    ;; int64 _output
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _output_text
       (send _output_text :serialize s)
     ;; int64 _output
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _output (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _output) (= (length (_output . bv)) 2)) ;; bignum
              (write-long (ash (elt (_output . bv) 0) 0) s)
              (write-long (ash (elt (_output . bv) 1) -1) s))
             ((and (class _output) (= (length (_output . bv)) 1)) ;; big1
              (write-long (elt (_output . bv) 0) s)
              (write-long (if (>= _output 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _output s)(write-long (if (>= _output 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _output_text
     (send _output_text :deserialize buf ptr-) (incf ptr- (send _output_text :serialization-length))
   ;; int64 _output
#+(or :alpha :irix6 :x86_64)
      (setf _output (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _output (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass test_1::test_srv
  :super ros::object
  :slots ())

(setf (get test_1::test_srv :md5sum-) "53244230a18aeabb17bd81ddb3a8f9e8")
(setf (get test_1::test_srv :datatype-) "test_1/test_srv")
(setf (get test_1::test_srv :request) test_1::test_srvRequest)
(setf (get test_1::test_srv :response) test_1::test_srvResponse)

(defmethod test_1::test_srvRequest
  (:response () (instance test_1::test_srvResponse :init)))

(setf (get test_1::test_srvRequest :md5sum-) "53244230a18aeabb17bd81ddb3a8f9e8")
(setf (get test_1::test_srvRequest :datatype-) "test_1/test_srvRequest")
(setf (get test_1::test_srvRequest :definition-)
      "std_msgs/String input_text
int64       input

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String output_text
int64       output

================================================================================
MSG: std_msgs/String
string data
")

(setf (get test_1::test_srvResponse :md5sum-) "53244230a18aeabb17bd81ddb3a8f9e8")
(setf (get test_1::test_srvResponse :datatype-) "test_1/test_srvResponse")
(setf (get test_1::test_srvResponse :definition-)
      "std_msgs/String input_text
int64       input

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String output_text
int64       output

================================================================================
MSG: std_msgs/String
string data
")



(provide :test_1/test_srv "53244230a18aeabb17bd81ddb3a8f9e8")


