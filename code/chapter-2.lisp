;; Textbook 
(defun sentence () (append (noun-phrase) (verb-phrase)))

(defun noun-phrase () (append (Article) (Noun)))

(defun verb-phrase () (append (Verb) (noun-phrase)))

(defun Article () (one-of '(the a)))

(defun Noun () (one-of '(man ball toy car)))
(defun Verb () (one-of '(throws eats spits lifts)))

(defun one-of (choices)
  (list (random-elt choices)))
