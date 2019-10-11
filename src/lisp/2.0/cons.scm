(display "rational number\n")





(define x (cons 1 2))

(define (square x) (* x x))
(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline (car x))
(displaynewline (cdr x))
(displaynewline  x)

