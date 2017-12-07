;; this is a lisp "game"
;; I am using Rstudio ;) to write and 
;; run the commands using terminal and the clisp REPL

(defparameter *small* 1)
(defparameter *big* 100)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1))

(defun start-over () 
  (defparameter *small* 1) 
  (defparameter *big* 100) 
  (guess-my-number))

(defun bigger() 
  (setf *small* (1+ (guess-my-number))) 
  (guess-my-number))
  
(defun smaller()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))