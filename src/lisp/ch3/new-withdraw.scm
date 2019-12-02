(display "new withdraw\n")



(define (displaynewline x)
    (display x)
    (newline)
)

(define (make-withdraw initial-amount)
    (
        let ((balance initial-amount))
        (lambda (amount) 
                (if (>= balance amount)
                    (begin (set! balance (- balance amount))
                        balance
                    )
                    "Insufficient funds"
                )   
        )
    )
)
(define w1 (make-withdraw 100))
(define w2 (make-withdraw 100))
(displaynewline (w1 51))
(displaynewline (w2 59))


