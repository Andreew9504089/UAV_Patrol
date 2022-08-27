
(cl:in-package :asdf)

(defsystem "auto_flight-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ncrl_link" :depends-on ("_package_ncrl_link"))
    (:file "_package_ncrl_link" :depends-on ("_package"))
  ))