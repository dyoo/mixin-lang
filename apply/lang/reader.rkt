#lang racket/base

(define (my-read in)
  (syntax->datum (my-read-syntax #f in)))


(define (my-read-syntax src in)
  eof)


(provide (rename-out [my-read read]
                     [my-read-syntax read-syntax]))