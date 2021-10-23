
(cl:in-package :asdf)

(defsystem "pracs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "fuse" :depends-on ("_package_fuse"))
    (:file "_package_fuse" :depends-on ("_package"))
    (:file "mymsg" :depends-on ("_package_mymsg"))
    (:file "_package_mymsg" :depends-on ("_package"))
  ))