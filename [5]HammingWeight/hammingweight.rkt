#lang racket

(define (hamming-weight x)
  (length (filter positive? x)))

(hamming-weight '(1 0 1 0 0 0 1 1 1 1 0))
