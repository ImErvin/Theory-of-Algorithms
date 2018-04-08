#lang racket
; LRCycle - Written by Ervin Mamutov | github.com/imervin
; ------------------------------------------------------------
; *Thourough explanation in the README.md @ github.com/imervin/Theory-of-Algorithms/tree/master/%5B3%5DLRCycle*
;
; This solution contains five functions ([1],[2],[3],[4],[5]).
; [1] lcycle - This function is used to combine the last elements (where last is anything != first) with the first element
;     in that order by passing them into the 5th function.
;
; [2] rcycle - This function is used to combine the last element of a list to the remaining elements in that order by
;     passing them into the 5th function.
;
; [3] last - This function is used to find and return the last element of a list - by using cursion with cdr to break down
;     a list with a control of null? to know when to stop. This function stops on the second last cdr and returns the number
;     at the point.
;
; [4] firstFew - This function is used to create a list of all the elements of another list except for the last element. By
;     using recursion with cons and passing the first element of a pair every iteration until the second last where I return
;     null to close the list creation.
;
; [5] combine - This function is used to take two lists and create a single list. Works similar to firstFew but the cons logic
;     is in the else.
;
;------------------------------------------------------------

; [1]
(define (lcycle n)
  (combine (cdr n) (cons (car n) null)))

; [2]
(define (rcycle n)
  (combine (last n) (firstFew n)))

; [3]
(define (last n)
  (if (null? (cdr n))
      n
      (last (cdr n))))

; [4]
(define (firstFew n)
  (cons (car n) (if (null? (cdr (cdr n)))
                    null
                    (firstFew (cdr n)))))

; [5]
(define (combine n o)
  (if (null? n)
      o
      (cons (car n) (combine (cdr n) o))))

; Testcases

(lcycle '(1 2 3 4 5))
; Expected Result: '(2 3 4 5 1)

(rcycle '(1 2 3 4 5))
; Expected Result: '(5 1 2 3 4)