#lang racket
; Define a start to the loop
(define g 7)

; Trying to see if I can create a function that divides two integers and returns t or f
; if a number is whole or not
;(define (tester g n) (exact-integer? (/ g n)))

;(tester 1 3)



; Create function decide-prime that takes the start of the "loop" as a parameter
(define (decide-prime n)
  (if (= g n)
     #t
  (if(exact-integer? (/ g n))
     #f
     (decide-prime(+ n 1)))))

(decide-prime 2)