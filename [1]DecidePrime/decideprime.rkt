#lang racket
; Define a start to the loop
(define start 2)

; Trying to see if I can create a function that divides two integers and returns t or f
; if a number is whole or not
(define (tester g n) (exact-integer? (/ g n)))

(tester 1 3)