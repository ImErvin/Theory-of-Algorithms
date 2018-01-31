#lang racket
(define listOfNs '())

(define (collatzlist n)
  (append listOfNs n)
  (if (<= n 1)
      listOfNs
      (if (odd? n)
          (collatzlist (odd n))
          (collatzlist (even n)))))
          

(define (odd n)
  (+ (* 3 n) 1)
 )

(define (even n)
  (/ n 2)
 )

(odd 4)
(even 4)
(collatzlist 10)