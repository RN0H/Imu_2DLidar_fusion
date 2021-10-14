
(cl:in-package :asdf)

(defsystem "pracs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mysrv" :depends-on ("_package_mysrv"))
    (:file "_package_mysrv" :depends-on ("_package"))
  ))