(display "map & mul args\n")
(define (for-each2 f l)
    (if (null? l)
        l
        (   
            (f (car l))
            (null? (for-each2 f (cdr l)))
        )
    )
)
(define (square-list2 l)
    (if (null? l)
        l 
        (cons (square (car l)) (square-list2 (cdr l)))
    )
)
(define (square x)
    (* x x)
)
(define (square-list l)
    (map (lambda (x) (* x x)) l)
)
(define (map proc l)
    (if (null? l)
        l 
        (cons (proc (car l)) (map proc (cdr l)))
    )
)
(define (scale-list l fac)
    (if (null? l)
        l 
        (cons (* (car l) fac)
            (scale-list (cdr l) fac)
        )
    )
)
(define (same-parity x . y)
    (define (same y blist)
        (if (null? y)
            blist
            (cond 
               ( (same-remainder x  (car y) ) (same (cdr y) (append blist (list (car y)) ) ) ) 
                (else  (same (cdr y) blist))
            )
        )
    )
    (same y (list x))
)

(define (same-remainder x y )
    (= (remainder x 2) (remainder y 2))
)

(define (even? x )
    (= 0 (remainder x 2) )
)

(define (f x y . z) 
    (append (list x y ) z)
)

(define (displaynewline x)
    (display x)
    (newline)
)


(define list-one-four (list 1 2 3 4))
(displaynewline (same-parity 0 2 3 4 5 6 7 8 19))
(displaynewline (same-remainder 2 3) )
(displaynewline (scale-list list-one-four 10))

(displaynewline (map abs (list -1 -2 -3 -4)))
(displaynewline (square-list (list -1 -2 -3 -4)))
(displaynewline (square-list2 (list -1 -2 -3 -4)))
; (for-each2 (lambda (x) (newline) (display x) ) list-one-four)
(for-each2 displaynewline list-one-four)


