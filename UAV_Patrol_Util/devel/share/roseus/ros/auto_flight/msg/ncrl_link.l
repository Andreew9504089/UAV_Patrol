;; Auto-generated. Do not edit!


(when (boundp 'auto_flight::ncrl_link)
  (if (not (find-package "AUTO_FLIGHT"))
    (make-package "AUTO_FLIGHT"))
  (shadow 'ncrl_link (find-package "AUTO_FLIGHT")))
(unless (find-package "AUTO_FLIGHT::NCRL_LINK")
  (make-package "AUTO_FLIGHT::NCRL_LINK"))

(in-package "ROS")
;;//! \htmlinclude ncrl_link.msg.html


(defclass auto_flight::ncrl_link
  :super ros::object
  :slots (_mode _aux_info _data1 _data2 _data3 ))

(defmethod auto_flight::ncrl_link
  (:init
   (&key
    ((:mode __mode) "")
    ((:aux_info __aux_info) "")
    ((:data1 __data1) 0.0)
    ((:data2 __data2) 0.0)
    ((:data3 __data3) 0.0)
    )
   (send-super :init)
   (setq _mode (string __mode))
   (setq _aux_info (string __aux_info))
   (setq _data1 (float __data1))
   (setq _data2 (float __data2))
   (setq _data3 (float __data3))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:aux_info
   (&optional __aux_info)
   (if __aux_info (setq _aux_info __aux_info)) _aux_info)
  (:data1
   (&optional __data1)
   (if __data1 (setq _data1 __data1)) _data1)
  (:data2
   (&optional __data2)
   (if __data2 (setq _data2 __data2)) _data2)
  (:data3
   (&optional __data3)
   (if __data3 (setq _data3 __data3)) _data3)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ;; string _aux_info
    4 (length _aux_info)
    ;; float32 _data1
    4
    ;; float32 _data2
    4
    ;; float32 _data3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;; string _aux_info
       (write-long (length _aux_info) s) (princ _aux_info s)
     ;; float32 _data1
       (sys::poke _data1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _data2
       (sys::poke _data2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _data3
       (sys::poke _data3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _aux_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _aux_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _data1
     (setq _data1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _data2
     (setq _data2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _data3
     (setq _data3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get auto_flight::ncrl_link :md5sum-) "07c672e9218196d466a602767f407d91")
(setf (get auto_flight::ncrl_link :datatype-) "auto_flight/ncrl_link")
(setf (get auto_flight::ncrl_link :definition-)
      "string mode
string aux_info
float32 data1
float32 data2
float32 data3
")



(provide :auto_flight/ncrl_link "07c672e9218196d466a602767f407d91")


