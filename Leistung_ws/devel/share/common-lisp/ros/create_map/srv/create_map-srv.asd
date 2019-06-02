
(cl:in-package :asdf)

(defsystem "create_map-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "create_map_srv" :depends-on ("_package_create_map_srv"))
    (:file "_package_create_map_srv" :depends-on ("_package"))
  ))