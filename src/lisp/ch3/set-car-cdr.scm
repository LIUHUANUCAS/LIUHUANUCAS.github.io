(display "set car-cdr \n")
(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x
)
(define (displaynewline x)
    (display x)
    (newline)
)
(define (append x y)
    (if (null? x)
        y
        (cons (car x) (append (cdr x) y))
    )
)
(define (last-pair x)
    (if (null? (cdr x))
        x 
        (last-pair (cdr x))
    )
)
(define (append! x y )
    (set-cdr! (last-pair x) y)
    x
)
(define (get-new-pair)
    (cons 'x 'y )
)
(define (cons1 x y)
    (let 
        ((new (get-new-pair)))
        (set-car! new x)
        (set-cdr! new y)
        new
    )
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
(displaynewline (cons1 1 2))
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
(define w (append! x y))
(displaynewline (append! (list 1 2 ) 3))
(displaynewline (cdr x))
(displaynewline z)
(displaynewline w)
(displaynewline (cdr x))
(define cz (make-cycle (list 'a 'b 'c 'd)))
(displaynewline cz)
; (displaynewline (last-pair cz))
(define (display-cycle x y)
    (if (eq? x y) 
        '()
        (begin (displaynewline (car x))
        (display-cycle (cdr x) y))
    )
)
(displaynewline "cz")
; (displaynewline cz )
; (displaynewline (cdr cz))
; (displaynewline (cdr (cdr cz)))
(display-cycle (cdr cz) cz )