#lang racket
; Collatz List - Written by Ervin Mamutov | github.com/imervin
; ------------------------------------------------------------
; This solution contains three functions ([1],[2] and [3]).
; [1] Is the main recursive function that builds a list recursively. 
;     The function is defined as "collatzlist" and takes a parameter "n"
;     which in this case is a positive whole integer and uses n to create
;     a list using rackets cons function. 
;
;     From my understanding cons is used to create a pair, and a list is 
;     basically a collection of pairs - so the idea behind this function is 
;     to nest a cons with the first value ([0]) of the list would be the initial
;     n and then do an operation on n and feed it back in.
;     It would look something like (cons 100 (cons 50 (cons .. null))) which would
;     produce a list that looks like '(100 50 ... 1).
;
;     The functions control for it to stop is: if n - 1 = 0 , and when it gets to that
;     point, it will set the last pairs second element (cdr) to null which will return the
;     produced list to the console. As long as n is not 1 it will check if the number is odd/even
;     using modulo (n % 2 = no remainder) and use function [2] if it's true and function [3] if it's false.
;     The produce of functions [2] and [3] are then fed back into function [1] to enable the recursion.
;     
;
; [2] Is a function to do collatz's even calculation on a number, it takes a parameter 'n' and returns
;     n / 2.
;
; [3] Is a function to do collatz's odd calculation on a number, it takes a parameter 'n' and returns
;     3n + 1.
;
; References
; Used Ian McLoughlin's github repo for racket lists as a method of understanding how cons works.
; - https://github.com/theory-of-algorithms/example-scheme/blob/master/lists.rkt
;------------------------------------------------------------

; [1]
(define (collatzlist n)
  (cons n (if (= (- n 1) 0)
              null
              (if (= (modulo n 2) 0)
                  (collatzlist (even n))
                  (collatzlist (odd n))))))

; [2]  
(define (even n)
  (/ n 2)
 )

; [3]
(define (odd n)
  (+ (* 3 n) 1)
 )

; Testcase 1
(collatzlist 10)

; Testcase 2
(collatzlist 25)

; Testcase 3
(collatzlist 99)
