;; Exercise problems from Chapter 1
;; Exercise 1.1
;; Define a function last-name that returns the last name of a name.
(defparameter *Suffixes* '(Jr. MD Sir Sr.))

(defun last-name (name)
  "Defining a last name finder for a full name"
  (if (member (first (last name)) *Suffixes*)
      (last-name (butlast name))
      (car (last name))))

(setf names '((Rex Morgan MD) (Carnival Sir) (Megan Markle Sr.)))

(mapcar #'last-name names)

;; Exercise 1.2
;; Define a function for exponentiation.
(defun power (number exponent)
  "Returns a number raised to the power."
  (if (not (equalp exponent 2))
      (* number (power number (+ exponent -1)))
      (* number number)
      )
  )
;; Works only for exponents *above* 2

;; Exercise 1.3
;; Count the number of atoms in an expression.
(defun count-atoms expression
  (setf counter 0)
  (if (isempty expression)
