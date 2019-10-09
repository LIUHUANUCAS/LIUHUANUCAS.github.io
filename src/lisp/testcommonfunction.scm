(display "isprime(x) prime number\n")

(define (F)
    (= 1 2)
)

(define (T)
    (= 1 1)
)

(define (runtime) (tms:clock (times)))

(define (displaynewline x) 
  (display x)
  (display "\n")
)
(define false '#f )

(define n 6)
(displaynewline (remainder n 100))
(displaynewline (F))
(displaynewline 'false )
(displaynewline false)
; (displaynewline (R))
(define time (runtime))
(displaynewline time)
