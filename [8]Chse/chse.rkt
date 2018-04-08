; chse - Written by Ervin Mamutov | github.com/imervin

#lang racket

(define (chse x y z)
  (map (lambda (x y z)
       (if (= 1 x)
           y
           z)) x y z))

(chse (list 0 0 0 0 1 1 1 1) 
       (list 0 0 1 1 0 0 1 1) 
       (list 0 1 0 1 0 1 0 1))