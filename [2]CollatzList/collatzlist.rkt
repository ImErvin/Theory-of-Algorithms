#lang racket

(define (collatzlist n)
  (print n)
  (cons n (if (= (- n 1) 0)
              null
              (if (odd? n)
                  (collatzlist (odd n))
                  (collatzlist (even n))))))
          

(define (odd n)
  (+ (* 3 n) 1)
 )

(define (even n)
  (/ n 2)
 )

(collatzlist 100)
