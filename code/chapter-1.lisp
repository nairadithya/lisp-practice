;; Exercise problems from Chapter 1
;; Exercise 1.1
;; Define a function last-name that returns the last name of a name.
(defparameter *Suffixes* '(Jr. MD Sir Sr.))

(defun last-name (name)
  "Defining a last name finder for a full name"
  (if (member (first (last name)) *Suffixes*)
      (last-name (butlast name))
      (car (last name))
      )
  )

(setf names '((Rex Morgan MD) (Carnival Sir) (Megan Markle Sr.)))

(mapcar #'last-name names)

;; Exercise 1.2
;; Define a function for exponentiation.
(defun power (number exponent)
  "Returns a number raised to the power."
  (cond ((= exponent 0) 1)
        ((= exponent 1) number)
        (t (* number (power number (- exponent 1))))))
;; Works only for exponents *above* 2
(power 3 3)

;; Exercise 1.3
;; Count the number of atoms in an expression.
(defun count-atoms (expression)
  "Counts the number of atoms in an expression"
  (cond  ((null expression) 0)
         ((atom expression) 1)
         (t (+ (count-atoms (first expression))
               (count-atoms (rest expression))))))

(setf a '(2 4 5))

(count-atoms a)
