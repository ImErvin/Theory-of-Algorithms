#lang racket


(define (lcycle n)
  (combine (cdr n) (cons (car n) null)))

(define (rcycle n)
  (combine (last n) (first n)))

(define (last n)
  (if (null? (cdr n))
      n
      (last (cdr n))))

(define (first n)
  (cons (car n) (if (null? (cdr (cdr n)))
                    null
                    (first (cdr n)))))

(define (combine n o)
  (if (null? n)
      o
      (cons (car n) (combine (cdr n) o))))

(lcycle '(1 2 3 4 5))

(rcycle '(1 2 3 4 5))