#lang racket
; Define a start to the loop
(define g 2)

; Trying to see if I can create a function that divides two integers and returns t or f
; if a number is whole or not
;(define (tester g n) (exact-integer? (/ g n)))

;(tester 1 3)




(define (decide-prime n)
  (cond
   [(= g n) #f]
   [(exact-integer? (/ g n)) (error "doesn't get here, either")]
   [(positive? 5) 'here]))

(decide-prime 37)