(display "tree2\n")


(define (fringe x)
    (cond ((null? x) x)
        ((not (pair? x)) (list x))
        (else (append (fringe (car x)) (fringe (cdr x))))
        )
)

(define (displaynewline x)
    (display x)
    (newline)
)


(define x1 (list (list 1 2) (list 3 4)))
(displaynewline  (fringe (list x1 x1)))
(displaynewline  (fringe x1))



