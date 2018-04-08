#lang racket

(car '(1 2 3 4))
(car '(1 2 3 4 5 6 7 8 9 10))
(cdr '(1 2 3 4))
(cdr (cdr (cdr '(1 2 3 4))))
(list? (car '(1 2 3 4)))
(list? (cdr (cdr (cdr '(1 2 3 4)))))
(null? (cdr (cdr (cdr (cdr '(1 2 3 4))))))
(null? (cdr (list 1 1)))

(define (test n)
  (print n)
  (if (null? n)
      n
      (test (cdr n))))

(define (test n)
  (cons (cdr n) (cons (car n) null)))

(test '(1 2 3 4 5))

;(define (test n)
  