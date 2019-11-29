(display "make account\n")


; 3.2
(define (make-monitor f)
    (define (wrap-f n )
        (lambda (x) 
            (cond 
                ((eq? x 'reset-count) (set! n 0) n )
                ((eq? x 'how-many-calls?) n)
                (else (
                    begin (set! n (+ 1 n)) (f x)
                    )
                )
            )
        )
    )
    (wrap-f 0)
)

; 3.3 3.4
(define (make-account balance pwd)
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
    (define (invalid-pwd m )
        "Incorrect password"
    )
    (define (dispatch2  password m)
        (cond 
            ((eq? pwd password) (dispatch m))
            (else  invalid-pwd)
        )
    )
    (define (call-the-cops m)
        "too many password error"
    )
    (define (dispatch3   n)
        (lambda (password m)
            (cond 
                ((eq? pwd password) (begin (set! n 0 ) (dispatch m)))
                (else  
                    (
                        begin (set! n (+ 1 n))
                        (if (>= n 7)
                            call-the-cops
                            invalid-pwd
                        )
                    )
                )
            )
        )
    )

    (dispatch3 0)
)


(define (displaynewline x)
    (display x)
    (newline)
)

;(define (test-make-account-2)
(define acc (make-account 100 'secret-password))
(displaynewline ((acc 'secret-password 'withdraw) 40))
(displaynewline ((acc 'secret-password 'withdraw) 80))
(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'secret-password 'withdraw) 80))

(displaynewline ((acc 'some-other-password 'deposit) 50) )
(displaynewline ((acc 'some-other-password 'deposit) 50) )
;(displaynewline ((acc 'some-other-password 'deposit) 50) )
;(displaynewline (call-the-cops))
