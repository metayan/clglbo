;;;; clglbo.asd

(asdf:defsystem #:clglbo
  :description "Describe clglbo here"
  :author "Ed Ye <hahahadude@gmail.com>"
  :license "Licenceless Rider"
  :depends-on (#:cl-opengl
               #:cl-glfw3
               #:cl-soil
               #:glkit
               #:defenum
               #:qua)
  :serial t
  :components ((:module src
                :components ((:file "package")
                             (:file "utils")
                             (:file "shader")
                             (:file "texture")
                             (:file "texture")
                             (:file "clglbo")))))

