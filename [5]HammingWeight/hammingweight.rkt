#lang racket


(define (hamming-weight1 x)
  (if (null? x)
      +0
      (if (= 0 (car x))
          (hamming-weight1(cdr x))
          (+ 1 (hamming-weight1(cdr x))))))

(hamming-weight1 '(1 0 1 0))
