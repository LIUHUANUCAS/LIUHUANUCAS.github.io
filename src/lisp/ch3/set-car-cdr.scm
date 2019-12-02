(display "set car-cdr \n")



(define (displaynewline x)
    (display x)
    (newline)
)
(define (test-set-car )

    (define x (cons 1 2))
    (define  y '(e f) )
    (displaynewline x)
    (set-car! x 3)
    (displaynewline x)
    (set! x (list '(a b) 'c 'd))
    (displaynewline x)
    ; (set! y '(a b))
    (displaynewline y)
    (set-car! x y)
    (displaynewline x)


)

(test-set-car)


