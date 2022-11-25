
(cl:in-package :asdf)

(defsystem "ecobot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ussensor_mngt" :depends-on ("_package_ussensor_mngt"))
    (:file "_package_ussensor_mngt" :depends-on ("_package"))
  ))