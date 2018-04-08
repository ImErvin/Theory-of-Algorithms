#lang racket

(define (sublsum x)
  (filter (lambda (x)
            (if (null? x)
                #f
            (= 0 (apply + x)))) (combinations x)))

(sublsum '(1 2 3 4 -5))
(sublsum '(1 2 3 4 5))

