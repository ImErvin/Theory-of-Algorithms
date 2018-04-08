#lang racket

(define (maj x y z)
  (map (lambda (x y z)
         (if (> (+ x y z) 1)
           1
           0)) x y z))

(maj (list 0 0 0 0 1 1 1 1)
      (list 0 0 1 1 0 0 1 1)
      (list 0 1 0 1 0 1 0 1))