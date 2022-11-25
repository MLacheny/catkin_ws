;; Auto-generated. Do not edit!


(when (boundp 'ecobot::ussensor_mngt)
  (if (not (find-package "ECOBOT"))
    (make-package "ECOBOT"))
  (shadow 'ussensor_mngt (find-package "ECOBOT")))
(unless (find-package "ECOBOT::USSENSOR_MNGT")
  (make-package "ECOBOT::USSENSOR_MNGT"))
(unless (find-package "ECOBOT::USSENSOR_MNGTREQUEST")
  (make-package "ECOBOT::USSENSOR_MNGTREQUEST"))
(unless (find-package "ECOBOT::USSENSOR_MNGTRESPONSE")
  (make-package "ECOBOT::USSENSOR_MNGTRESPONSE"))

(in-package "ROS")





(defclass ecobot::ussensor_mngtRequest
  :super ros::object
  :slots (_sensor_id _message ))

(defmethod ecobot::ussensor_mngtRequest
  (:init
   (&key
    ((:sensor_id __sensor_id) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _sensor_id (round __sensor_id))
   (setq _message (string __message))
   self)
  (:sensor_id
   (&optional __sensor_id)
   (if __sensor_id (setq _sensor_id __sensor_id)) _sensor_id)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; int8 _sensor_id
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _sensor_id
       (write-byte _sensor_id s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _sensor_id
     (setq _sensor_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor_id 127) (setq _sensor_id (- _sensor_id 256)))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ecobot::ussensor_mngtResponse
  :super ros::object
  :slots (_response _deactivated_id ))

(defmethod ecobot::ussensor_mngtResponse
  (:init
   (&key
    ((:response __response) "")
    ((:deactivated_id __deactivated_id) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _response (string __response))
   (setq _deactivated_id __deactivated_id)
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:deactivated_id
   (&optional __deactivated_id)
   (if __deactivated_id (setq _deactivated_id __deactivated_id)) _deactivated_id)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ;; int8[] _deactivated_id
    (* 1    (length _deactivated_id)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;; int8[] _deactivated_id
     (write-long (length _deactivated_id) s)
     (dotimes (i (length _deactivated_id))
       (write-byte (elt _deactivated_id i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8[] _deactivated_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _deactivated_id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _deactivated_id i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _deactivated_id i) 127) (setf (elt _deactivated_id i) (- (elt _deactivated_id i) 256)))
     ))
   ;;
   self)
  )

(defclass ecobot::ussensor_mngt
  :super ros::object
  :slots ())

(setf (get ecobot::ussensor_mngt :md5sum-) "4c3193c5a00d0932168fd4da30077568")
(setf (get ecobot::ussensor_mngt :datatype-) "ecobot/ussensor_mngt")
(setf (get ecobot::ussensor_mngt :request) ecobot::ussensor_mngtRequest)
(setf (get ecobot::ussensor_mngt :response) ecobot::ussensor_mngtResponse)

(defmethod ecobot::ussensor_mngtRequest
  (:response () (instance ecobot::ussensor_mngtResponse :init)))

(setf (get ecobot::ussensor_mngtRequest :md5sum-) "4c3193c5a00d0932168fd4da30077568")
(setf (get ecobot::ussensor_mngtRequest :datatype-) "ecobot/ussensor_mngtRequest")
(setf (get ecobot::ussensor_mngtRequest :definition-)
      "# Mybot ultrasound sensors management message
# 
#  - message: should be either ACTIVATE, DEACTIVATE or STATUS
#  - sensor_id: ID of the US sensor to activate or deactivate. 
#  - response: a short message confirming the action of the service
#  - deactivated_id: a list of US sensor IDS that have been deactivated

int8 sensor_id
string message
---
string response
int8[] deactivated_id

")

(setf (get ecobot::ussensor_mngtResponse :md5sum-) "4c3193c5a00d0932168fd4da30077568")
(setf (get ecobot::ussensor_mngtResponse :datatype-) "ecobot/ussensor_mngtResponse")
(setf (get ecobot::ussensor_mngtResponse :definition-)
      "# Mybot ultrasound sensors management message
# 
#  - message: should be either ACTIVATE, DEACTIVATE or STATUS
#  - sensor_id: ID of the US sensor to activate or deactivate. 
#  - response: a short message confirming the action of the service
#  - deactivated_id: a list of US sensor IDS that have been deactivated

int8 sensor_id
string message
---
string response
int8[] deactivated_id

")



(provide :ecobot/ussensor_mngt "4c3193c5a00d0932168fd4da30077568")


