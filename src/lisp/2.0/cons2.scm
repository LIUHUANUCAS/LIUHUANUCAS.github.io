(display "cons define \n")

(define (cons x y)
  (lambda (m) (m x y ))
)

(define (car z)
  (z (lambda (p q) p))
)

(define (cdr z)
  (z (lambda (p q) q))
)

; (define x (cons 1 2))

(define (displaynewline x) 
  (display x)
  (display "\n")
)
; (displaynewline (car x))
; (displaynewline (cdr x))
; (displaynewline  x)
(displaynewline (car (cons 1 2)))
(displaynewline (cdr (cons 1 2)))

