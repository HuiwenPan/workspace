
(cl:in-package :asdf)

(defsystem "img_prc-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Dominant" :depends-on ("_package_Dominant"))
    (:file "_package_Dominant" :depends-on ("_package"))
    (:file "Graubild" :depends-on ("_package_Graubild"))
    (:file "_package_Graubild" :depends-on ("_package"))
    (:file "Kanten" :depends-on ("_package_Kanten"))
    (:file "_package_Kanten" :depends-on ("_package"))
    (:file "Negbild" :depends-on ("_package_Negbild"))
    (:file "_package_Negbild" :depends-on ("_package"))
  ))