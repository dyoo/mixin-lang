#lang scribble/manual

@title{@tt{mixin-lang}: mixing languages together}
@author+email["Danny Yoo" "dyoo@cs.wpi.edu"]

@section{Introduction}


I want to be able to @emph{mixin} languages together.


Let's say that I want to take any language, treat it as a parent, and
then add my custom @racket[#%app] binding to it.

It's possible to do this by hand, but I want to make it stupidly easy.
Here's what I want.  I would love to be able to say:

@filebox["my-traced-racket.rkt"]{
@verbatim|{
   #lang planet dyoo/mixin-lang/apply-mixin
   #:parent racket
   #:mixin "my-lang.rkt"
}|}


where @filepath{trace-mixin.rkt} look like this:
@filebox["trace-mixin.rkt"]{
@verbatim|{
#lang planet dyoo/mixin-lang/mixin

(define-syntax-rule (#%app operator operands ...)
  (begin (printf "Application with ~s" operator)
         ;; parent-trap?
         (#%parent-#%app operator operands ...)))
  

(provide #%app)
}|
}



The Right Thing that this should do is generate the necessary code to
mix-in the languages together.  @filepath{my-traced-racket} should
create a new module language that, for the most part, is
@racketmodname[racket], except for the overridden @racket[#%app]
binding.  The @emph{mixin} module should be able to use the parent
bindings, because they should all be prefixed with
@racket[#%parent:...].
