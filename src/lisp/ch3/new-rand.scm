(display "new rand\n")


(define (rand s)
(let ((n (random (expt 2 10))))

    (define (wrap-reset )
        (lambda (new-value) (begin (set! n new-value) new-value))
    )
    (define (wrap-generate)
        (begin (set! n (random n)) n)
    )
    (cond 
        ((eq? s 'reset ) (wrap-reset))
        ((eq? s 'generate ) (wrap-generate))
    )
)
)




(define (displaynewline x)
    (display x)
    (newline)
)
(define (test-rand x)
    (displaynewline ((rand 'reset) x ))
    (displaynewline (rand 'generate))
    (displaynewline (rand 'generate))
)
(test-rand 100)
(displaynewline "-----------")
(test-rand 100)
(displaynewline (random 100))
(displaynewline (random 100))
