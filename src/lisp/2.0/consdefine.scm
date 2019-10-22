(display "cons define \n")

(define (cons x y)
  (define (dispatch m)
      (cond ((= 0 m) x)
        ((= 1 m) y)
        (else (error "argument not 0 or 1 "))
        )
  )
  dispatch
)

(define (car z) (z 0 ))
(define (cdr z) (z 1 ))

(define x (cons 1 2))

(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline (car x))
(displaynewline (cdr x))
(displaynewline  x)

