(display "list\n")
; get list length 
(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))
    )
)

; get length of list 
(define (length2 items)
    (define (length-iter a count )
        (if (null? a)
            count 
            (length-iter (cdr a) (+ 1 count))
        )
    )
    (length-iter items 0)
)
; append list a b 
(define (list-append lista listb)
    (if (null? lista)
        listb
        (cons  (car lista) (list-append (cdr lista) listb) )
    )
)
; get list index n
(define (list-ref item n)
    (if (= 0 n)
        (car item)
        (list-ref (cdr item ) (- n 1) )
    )
)

(define (list-pair item)
    (if (null? (cdr item))
        (car item)
        (list-pair (cdr item))
    )
)
; reverse list 
(define (reverse-list alist)
    (if (null?  alist)
        alist
        (
            list-append (reverse-list (cdr alist))  (list (car alist))
        )
    )
)
(define (displaynewline x)
    (display x)
    (newline)
)

(define list-one-four (list 1 2 3 4))
(define alist (list 1 2 3 4))
(define blist (list 1 4 9 16 25))
(displaynewline (cdr list-one-four))
(displaynewline (list-ref list-one-four 2))
(displaynewline (length list-one-four ))
(displaynewline (length2 list-one-four ))
(displaynewline (cdr (append alist blist)))
(displaynewline (list-pair alist))
(displaynewline (list-pair blist))
(displaynewline (list-pair list-one-four))
(displaynewline (list-append alist blist))
(displaynewline alist)
(displaynewline (reverse-list (append alist blist)))