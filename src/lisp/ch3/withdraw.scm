(display "with draw\n")
; 3.1
(define (make-accumulator init)
    (lambda (n) 
        (set! init (+ n init))
        init
    )
)
(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
                (begin (set! balance (- balance amount))
                    balance
                )
                 "Insufficient funds"
            ) 
    )
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance
    )
    (define (dispatch m)
        (cond 
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT m"))
        )
    )
    dispatch
)


(define (make-withdraw balance)
    (lambda (amount) 
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                    balance
                )
                 "Insufficient funds"
            )   
    )
)
(define balance 100)

(define (new-withdraw)
    (
        let ((balance 100))
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
(define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
            balance
        )
        "Insufficient funds"
    )
)

(define (displaynewline x)
    (display x)
    (newline)
)


(define (test-withdraw )
    (displaynewline "withdraw")
    (displaynewline (withdraw 25))
    (displaynewline (withdraw 25))
    (displaynewline (withdraw 60))
    (displaynewline (withdraw 15))
)

(define (test-new-withdraw )
    (displaynewline "new-withdraw")
    (let 
        ((withdraw (new-withdraw)))
        (displaynewline (withdraw 25))
        (displaynewline (withdraw 25))
        (displaynewline (withdraw 60))
        (displaynewline (withdraw 15))
    )
)

(define (test-make-withdraw )
    (displaynewline "make-withdraw")
    (let 
        (
            (W1 (make-withdraw 100))
            (W2 (make-withdraw 100))
        )
        (displaynewline (W1 50))
        (displaynewline (W2 70))
        (displaynewline (W2 40))
        (displaynewline (W1 40))
    )
)
(define (test-make-account)
    (
        ; (displaynewline "make-account")
        let 
        (
            (acc (make-account 100))
        )
        (displaynewline ((acc 'withdraw) 50))
        (displaynewline ((acc 'withdraw) 60))
        (displaynewline ((acc 'deposit) 40))
        (displaynewline ((acc 'withdraw) 60))
    )
)

(define (test-make-accumulator)
    (let 
        ((A (make-accumulator 0)))
        (displaynewline (A 10))
        (displaynewline (A 10))
        (displaynewline (A 100))
    )
)

(test-withdraw)
(test-new-withdraw)
(test-make-withdraw)
(test-make-account)
(test-make-accumulator)

