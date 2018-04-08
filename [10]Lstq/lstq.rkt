; lstq - Written by Ervin Mamutov | github.com/imervin

#lang racket

(define (sum x)
  (if (null? x)
      0
      (+ (car x) (sum (cdr x)))))

(define (lstq x y)
  (sum (map (lambda (x y)
       (* (- x y) (- x y))) x y)))

(lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))