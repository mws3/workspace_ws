;; Auto-generated. Do not edit!


(when (boundp 'custom_msg::sensor_data)
  (if (not (find-package "CUSTOM_MSG"))
    (make-package "CUSTOM_MSG"))
  (shadow 'sensor_data (find-package "CUSTOM_MSG")))
(unless (find-package "CUSTOM_MSG::SENSOR_DATA")
  (make-package "CUSTOM_MSG::SENSOR_DATA"))

(in-package "ROS")
;;//! \htmlinclude sensor_data.msg.html


(defclass custom_msg::sensor_data
  :super ros::object
  :slots (_id _name _temperature _humidity ))

(defmethod custom_msg::sensor_data
  (:init
   (&key
    ((:id __id) 0)
    ((:name __name) "")
    ((:temperature __temperature) 0.0)
    ((:humidity __humidity) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _name (string __name))
   (setq _temperature (float __temperature))
   (setq _humidity (float __humidity))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:humidity
   (&optional __humidity)
   (if __humidity (setq _humidity __humidity)) _humidity)
  (:serialization-length
   ()
   (+
    ;; int16 _id
    2
    ;; string _name
    4 (length _name)
    ;; float32 _temperature
    4
    ;; float32 _humidity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _id
       (write-word _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _humidity
       (sys::poke _humidity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _humidity
     (setq _humidity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get custom_msg::sensor_data :md5sum-) "4232267298bafc38ea3a96c60eecc6d5")
(setf (get custom_msg::sensor_data :datatype-) "custom_msg/sensor_data")
(setf (get custom_msg::sensor_data :definition-)
      "int16 id 
string name 
float32 temperature 
float32 humidity 
")



(provide :custom_msg/sensor_data "4232267298bafc38ea3a96c60eecc6d5")


