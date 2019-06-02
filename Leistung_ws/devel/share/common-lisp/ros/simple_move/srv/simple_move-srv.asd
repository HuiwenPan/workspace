
(cl:in-package :asdf)

(defsystem "simple_move-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "simple_move_server" :depends-on ("_package_simple_move_server"))
    (:file "_package_simple_move_server" :depends-on ("_package"))
  ))