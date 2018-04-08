#lang racket

(define (sod2 x y z)
  (map (lambda (x y z)
       (if (= (modulo (+ x y z) 2) 0)
           0
           1)) x y z))

(sod2 (list 0 0 0 0 1 1 1 1) 
       (list 0 0 1 1 0 0 1 1) 
       (list 0 1 0 1 0 1 0 1))