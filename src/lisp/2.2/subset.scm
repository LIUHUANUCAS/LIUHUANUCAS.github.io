(display "map tree\n")

(define (subset s)
    (if (null? s) 
        (list s)
        (let ((rest (subset (cdr s))))
            (append rest (map (lambda (x) (append x (list (car s) ))) rest) )
        )
    )
)

(define (displaynewline x)
    (display x)
    (newline)
)

(displaynewline (subset (list 1 2 3 4)))
