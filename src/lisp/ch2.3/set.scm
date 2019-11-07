(display "set\n")


(define (element-of-set? x set) ;2.59
	(cond
		((null? set) '#f)
		((equal? x (car set) ) '#t)
		(else (element-of-set? x (cdr set)))
	)
)

(define (union-set set1 set2)
    (cond 
        ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))
    )
)
(define (adjoin-set x set)
    (if (element-of-set? x set)
        set 
        (cons x set)
    )
)

(define (intersection-set set1 set2)
    (cond 
        ((or (null? set1 ) (null? set2) ) '())
        ((element-of-set? (car set1) set2)
            (cons (car set1) (intersection-set (cdr set1) set2))
        )
        (else  (intersection-set (cdr set1) set2))
    
    )
)

(define (displaynewline x)
  (display x)
  (newline)
)

(displaynewline (element-of-set? 1 '(0 2 3)))
(displaynewline (adjoin-set 2 '(2 3 4)))
(displaynewline (intersection-set '(2) '(2 3 4)))
(displaynewline (intersection-set '(2 4) '(2 3 4)))
(displaynewline (union-set '(2 4 1 0 -1) '(2 3 4)))