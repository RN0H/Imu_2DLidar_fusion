
(cl:in-package :asdf)

(defsystem "pracs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mymsg" :depends-on ("_package_mymsg"))
    (:file "_package_mymsg" :depends-on ("_package"))
  ))