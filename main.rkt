#lang racket

;; I need to figure out how to make a variable language.  Let's
;; say that I want to take any language, treat it as a parent, and
;; then add my custom #%app binding to it.
;;
;; Here's what I want.  I would love to be able to say
;;
;;   #lang mixin-lang
;;   #:parent racket
;;   #:child "my-lang.rkt"
;;
;; I want this to produce a module language that does the Right
;; Thing: it should create a new module language that, for the
;; most part, provides all the bindings of racket, but also
;; gives us a way to override those bindings in the child language.
;; The child should be able to use the parent bindings, because they
;; should all be prefixed with #%parent:...
