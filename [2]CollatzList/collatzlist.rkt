#lang racket
(list 1 2 3 4) ; create a list
(define l '( 1 2 3 4)) ; define l is a a list
l
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null))))) ; construct a list from cons of a and b
(append '(1 2) '(3 4)) ; Add to lists together using append
(append l 1) ; Try to append 1 to the end of l produces '(1 2 3 4 . 1)
(append l (cons 1 null)) ; Successfully got rid of the . using a cons of 1 and null