;; Reusing mappend
(defun mappend (fn list)
  (apply #'append (mapcar fn list)))

;; Textbook
;; Rudimentary grammar implementation
(defun sentence () (append (noun-phrase) (verb-phrase)))

(defun noun-phrase () (append (article) (noun)))

(defun verb-phrase () (append (verb) (noun-phrase)))

(defun article () (one-of '(the a)))

(defun noun () (one-of '(man ball toy car)))
(defun verb () (one-of '(throws eats spits lifts)))

(defun one-of (choices)
  (list (random-elt choices)))

(defun random-elt (choices)
  (elt choices (random (length choices))))

(sentence)
;; Rule based implementation
(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (article noun))
    (verb-phrase -> (verb noun-phrase))
    (article -> (the a))
    (noun -> (man ball woman table))
    (verb -> (hit took saw liked)))
  )

(setq *grammar* *simple-grammar*)

(assoc 'noun *grammar*)

(defun rule-lhs (rule)
  (first rule))

(defun rule-rhs (rule)
  (rest (rest rule)))

(defun rewrites (category)
  (rule-rhs (assoc category *grammar*)))

(defun generate (phrase)
  "Generate a random sentence"
  (cond ((listp phrase)
         (mappend #'generate phrase))
        ((rewrites phrase)
         (generate (random-elt (rewrites phrase))))
        (t (list phrase))))

(generate (sentence))

(defparameter *bigger-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (article Adj* noun PP*) (Name) (Pronoun))
    (verb-phrase -> (verb noun-phrase PP*))
    (PP* -> () (PP PP*))
    (Adj* -> () (Adj Adj*))
    (PP ->  (Prep noun-phrase))
    (Prep -> (to in by with on))
    (Adj -> (big little blue green adiabatic))
    (article -> (the a))
    (Name -> (Pat Kim Lee Terry Robin))
    (noun -> (man ball woman table))
    (verb -> (hit took saw liked))
    (Pronoun -> (he she it these those that))))

(setf *grammar* *bigger-grammar*)

(generate (sentence))
