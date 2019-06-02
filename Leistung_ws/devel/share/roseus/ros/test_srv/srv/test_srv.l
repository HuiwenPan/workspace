;; Auto-generated. Do not edit!


(when (boundp 'test_srv::test_srv)
  (if (not (find-package "TEST_SRV"))
    (make-package "TEST_SRV"))
  (shadow 'test_srv (find-package "TEST_SRV")))
(unless (find-package "TEST_SRV::TEST_SRV")
  (make-package "TEST_SRV::TEST_SRV"))
(unless (find-package "TEST_SRV::TEST_SRVREQUEST")
  (make-package "TEST_SRV::TEST_SRVREQUEST"))
(unless (find-package "TEST_SRV::TEST_SRVRESPONSE")
  (make-package "TEST_SRV::TEST_SRVRESPONSE"))

(in-package "ROS")





(defclass test_srv::test_srvRequest
  :super ros::object
  :slots (_input ))

(defmethod test_srv::test_srvRequest
  (:init
   (&key
    ((:input __input) 0)
    )
   (send-super :init)
   (setq _input (round __input))
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; int64 _input
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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

(defclass test_srv::test_srvResponse
  :super ros::object
  :slots (_output ))

(defmethod test_srv::test_srvResponse
  (:init
   (&key
    ((:output __output) 0)
    )
   (send-super :init)
   (setq _output (round __output))
   self)
  (:output
   (&optional __output)
   (if __output (setq _output __output)) _output)
  (:serialization-length
   ()
   (+
    ;; int64 _output
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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

(defclass test_srv::test_srv
  :super ros::object
  :slots ())

(setf (get test_srv::test_srv :md5sum-) "9cc62145209219f185101e72e3ae5c65")
(setf (get test_srv::test_srv :datatype-) "test_srv/test_srv")
(setf (get test_srv::test_srv :request) test_srv::test_srvRequest)
(setf (get test_srv::test_srv :response) test_srv::test_srvResponse)

(defmethod test_srv::test_srvRequest
  (:response () (instance test_srv::test_srvResponse :init)))

(setf (get test_srv::test_srvRequest :md5sum-) "9cc62145209219f185101e72e3ae5c65")
(setf (get test_srv::test_srvRequest :datatype-) "test_srv/test_srvRequest")
(setf (get test_srv::test_srvRequest :definition-)
      "
int64       input
---

int64       output
")

(setf (get test_srv::test_srvResponse :md5sum-) "9cc62145209219f185101e72e3ae5c65")
(setf (get test_srv::test_srvResponse :datatype-) "test_srv/test_srvResponse")
(setf (get test_srv::test_srvResponse :definition-)
      "
int64       input
---

int64       output
")



(provide :test_srv/test_srv "9cc62145209219f185101e72e3ae5c65")


