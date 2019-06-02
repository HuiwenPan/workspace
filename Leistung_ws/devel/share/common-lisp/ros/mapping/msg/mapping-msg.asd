
(cl:in-package :asdf)

(defsystem "mapping-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "map_point" :depends-on ("_package_map_point"))
    (:file "_package_map_point" :depends-on ("_package"))
  ))