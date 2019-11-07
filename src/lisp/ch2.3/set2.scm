(display "set\n")


(define (element-of-set? x set)
	(cond
		((null? set) '#f)
		((= x (car set) ) '#t)
		((< x (car set) ) '#f)
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
    (cond  ((null? set) (list x) )
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
    )
)

(define (intersection-set set1 set2)
    (if (or (null? set1 ) (null? set2) ) 
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
            (cond 
                ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))) )
                ((< x1 x2) (intersection-set (cdr set1) set2) )
                ((< x2 x1) (intersection-set set1 (cdr set2)) )
            )
        )
    )
)
       
        
       

(define (displaynewline x)
  (display x)
  (newline)
)

(displaynewline (element-of-set? 1 '(0 2 3)))
(displaynewline (adjoin-set 3 '(2 3 10)))
(displaynewline (intersection-set '(2) '(2 3 4)))
(displaynewline (intersection-set '( 1 2 4 ) '(1 2 3 4)))
(displaynewline (union-set '(2 4 1 0 -1) '(2 3 4)))