;;;; texture.lisp

(in-package #:clglbo)

(defclass texture2d ()
  ((id
    :accessor id
    :type unsigned-byte
    :initarg :id)
   (width
    :type unsigned-byte
    :initarg :width)
   (height
    :type unsigned-byte
    :initarg :width)
   (internal-format
    :initarg :internal-format)
   (image-format
    :initarg :image-format)
   (wrap-s
    :initarg :wrap-s)
   (wrap-t
    :initarg :wrap-t)
   (filter-min
    :initarg :filter-min)
   (filter-max
    :initarg :filter-max))
  (:default-initargs
   :width 0
   :height 0
   :internal-format :rgb
   :image-format :rgb
   :wrap-s :repeat
   :wrap-t :repeat
   :filter-min :linear
   :filter-max :linear))

(defmethod initialize-instance :after ((tex texture2d) &key)
  (setf (id tex) (gl:gen-textures 1)))

(defun generate-texture2d (texture tex-width tex-height data)
  (declare (texture2d texture) (unsigned-byte width height))
  (with-slots (width height id
               wrap-s wrap-t
               filter-min filter-max
               internal-format image-format) texture
    (setf width tex-width
          height tex-height)
    (gl:bind-texture :texture-2d id)
    (gl:tex-image-2d :texture-2d 0 :rgb width height 0 image-format :unsigned-byte data)
    (gl:tex-parameter :texture-2d :texture-wrap-s wrap-s)
    (gl:tex-parameter :texture-2d :texture-wrap-t wrap-t)
    (gl:tex-parameter :texture-2d :texture-min-filter filter-min)
    (gl:tex-parameter :texture-2d :texture-mag-filter filter-max)
    (gl:bind-texture :texture-2d 0)))

(defun bind-texture2d (texture)
  (declare (texture2d texture))
  (gl:bind-texture :texture-2d (id texture)))
