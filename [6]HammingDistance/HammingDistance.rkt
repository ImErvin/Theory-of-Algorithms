#lang racket

(define helper
  (lambda (x y) (= x y)))

(define (hamming-distance x y)
  (if (null? x)
      0
      (if (helper (car x) (car y))
          (hamming-distance (cdr x) (cdr y))
          (+ 1 (hamming-distance (cdr x) (cdr y))))))

(hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0))