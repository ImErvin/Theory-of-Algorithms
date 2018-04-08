#lang racket


(define (test n)
  (test1 (cdr n) (cons (car n) null)))

(define (test1 n o)
  (if (null? n)
      o
      (cons (car n) (test1 (cdr n) o))))

(test '(1 2 3 4 5))