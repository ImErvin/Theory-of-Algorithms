#lang racket

(define (collatzlist n)
  (cons n (if (= (- n 1) 0)
              null
              (if (= (modulo n 2) 0)
                  (collatzlist (even n))
                  (collatzlist (odd n))))))
          

(define (odd n)
  (+ (* 3 n) 1)
 )

(define (even n)
  (/ n 2)
 )

(collatzlist 100)
