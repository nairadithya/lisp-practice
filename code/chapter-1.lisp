;; Exercise problems from Chapter 1
;; Exercise 1.1
;;

(defparameter *Suffixes* '(Jr. MD Sir))

(defun last-name (input)
  "Defining a last name finder for a full name"
  (if (member (first (last input)) *Suffixes*)
      (last-name (input)))
  (first (last input))
  )

(setf names '((Rex Morgan MD) (Carnival Sir)))
(mapcar #'last-name names)
