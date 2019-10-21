(display "list\n")
; get list length 
(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))
    )
)
(define (count-leaves x)
  (cond ( (null? x) 0)
      ((not (pair? x)) 1)
      (else (+ (count-leaves (car x)) (count-leaves (cdr x))))
      )
)


(define (displaynewline x)
    (display x)
    (newline)
)

(define list-one-four (list 1 2 3 4))
(define alist (list 1 2 3 4))
(define blist (list 1 4 9 16 25))
(define x (cons (list 1 2 ) (list 3 4)))
(displaynewline (length x))
(displaynewline (count-leaves x))
