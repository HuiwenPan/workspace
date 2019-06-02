
(cl:in-package :asdf)

(defsystem "move_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DesiredPose" :depends-on ("_package_DesiredPose"))
    (:file "_package_DesiredPose" :depends-on ("_package"))
    (:file "ImgPoint" :depends-on ("_package_ImgPoint"))
    (:file "_package_ImgPoint" :depends-on ("_package"))
  ))