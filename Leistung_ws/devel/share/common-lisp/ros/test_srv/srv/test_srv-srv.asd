
(cl:in-package :asdf)

(defsystem "test_srv-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "test_srv" :depends-on ("_package_test_srv"))
    (:file "_package_test_srv" :depends-on ("_package"))
  ))