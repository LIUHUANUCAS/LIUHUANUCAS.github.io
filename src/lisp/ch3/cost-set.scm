(display "cost set\n")
(define (factorial1 n)
    (let 
        (
            (product 1)
            (counter 1)
        )
        (define (iter)
            (if (> counter n)
                product
                (begin (set! product (* product counter))
                    (set! counter (+ counter 1))
                    (iter)
                )
            )
        ) 
        (iter)
    )
)
(define (factorial n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product ) (+ counter 1))
        )
    )
    (iter 1  1)
)
(define (make-simplified-withdraw balance)
    (lambda (x) 
        (set! balance (- balance x))
        balance
    )
)

(define (make-decrementer balance)
    (lambda (x)  (- balance x))
)
(define (displaynewline x)
    (display x)
    (newline)
)
(define w (make-simplified-withdraw 25))
(define d (make-decrementer 25))
(displaynewline (w 20))
(displaynewline (w 10))
(displaynewline (d 20))
(displaynewline (d 10))
(displaynewline (factorial 10))
(displaynewline (factorial1 10))