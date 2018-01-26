#lang racket
; Decide Prime - Written by Ervin Mamutov | github.com/imervin
; ------------------------------------------------------------
; This solution contains two functions ([1] and [2]).
; [1] Is the recursive function named recurFunc that accepts two values (g and n)
;     These values are used as the conditions for the recursion. g is the number
;     in question of being prime and n is the index of the brute force that is
;     incremented each time the recursive function runs. n is always a number between
;     2 and g.
;
;     I can assume if the recursive loop ends up at the last index between 2 and g,
;     then the number must be prime as it has failed to divide by any number other
;     than itself to produce a positive whole number.
;
;     Brute force is time complexity heavy - I'm guessing it's O(n) where n is the
;     number of indices between 2 and g. A better way of doing this (if I understand
;     correctly) would be to simply:
;     Find the square root of the g and check the numbers between 2 and sqrt(g) -
;     further reading about this can be found here:
;     https://stackoverflow.com/questions/5811151/why-do-we-check-up-to-the-square-root-of-a-prime-number-to-determine-if-it-is-pr
;
; [2] Is the "user" function named decide-prime that accepts one integer be it
;     positive or negative and returns #t if the number is prime or #f if it is not.
;     Obviously any number less-than 2 is considered not-prime as it breaks the
;     conditions of a prime number.
;
; References
; Made no adaptations of other code - apart from using racket documentation for syntax etc.

;[1]
(define (recurFunc g n)
  (if (= g n)
     #t
  (if(exact-integer? (/ g n))
     #f
     (recurFunc g  (+ n 1) ))))

;[2]
(define (decide-prime n)
  (if (< n 2)
      #f
  (if (not (recurFunc n 2)) #f #t) ))

; Testcases for the functions
"Testcase 1 - is 17 a prime number?"
(decide-prime 17)
"Testcase 2 - is 6 a prime number?"
(decide-prime 6)
"Testcase 3 - is 1 a prime number?"
(decide-prime 1)
"Testcase 4 - is -37 a prime number?"
(decide-prime -37)