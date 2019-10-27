(display "gcd(a,b)\n")

(define (gcd a b )
    (if (= 0 b) 
        a 
        (gcd b (reminder a b))
    )
)

(define (reminder n x)
    (if  (< n x) n
        (reminder (- n x) x)
    )
)

(define (displaynewline x) 
  (display x)
  (display "\n")
)

(define a 206000000)
(define b 2)
(displaynewline (gcd a b))
; (displaynewline (reminder a b))
