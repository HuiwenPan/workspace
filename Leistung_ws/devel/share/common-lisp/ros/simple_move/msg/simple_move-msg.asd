
(cl:in-package :asdf)

(defsystem "simple_move-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "simple_moveAction" :depends-on ("_package_simple_moveAction"))
    (:file "_package_simple_moveAction" :depends-on ("_package"))
    (:file "simple_moveActionFeedback" :depends-on ("_package_simple_moveActionFeedback"))
    (:file "_package_simple_moveActionFeedback" :depends-on ("_package"))
    (:file "simple_moveActionGoal" :depends-on ("_package_simple_moveActionGoal"))
    (:file "_package_simple_moveActionGoal" :depends-on ("_package"))
    (:file "simple_moveActionResult" :depends-on ("_package_simple_moveActionResult"))
    (:file "_package_simple_moveActionResult" :depends-on ("_package"))
    (:file "simple_moveFeedback" :depends-on ("_package_simple_moveFeedback"))
    (:file "_package_simple_moveFeedback" :depends-on ("_package"))
    (:file "simple_moveGoal" :depends-on ("_package_simple_moveGoal"))
    (:file "_package_simple_moveGoal" :depends-on ("_package"))
    (:file "simple_moveResult" :depends-on ("_package_simple_moveResult"))
    (:file "_package_simple_moveResult" :depends-on ("_package"))
  ))