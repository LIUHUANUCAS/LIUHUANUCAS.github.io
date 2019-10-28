(display "map tree\n")

(define (subset s)
    (if (null? s) 
        (list s)
        (let ((rest (subset (cdr s))))
            (append rest (map (lambda (x) (append x (list (car s) ))) rest) )
        )
    )
)
(define (square x)
    (* x x)
)
(define (square-tree-proc tree )
    (tree-map square tree)
)

(define (tree-map f t)
    (map 
        (lambda (x)
            (
                if (pair? x)
                    (tree-map f x)
                    (f x)
            )        
        )
        t 
    )
)

(define (square-tree-map t)
    (map 
        (lambda (x)
            (
                if (pair? x)
                    (square-tree-map x)
                    (* x x)
            )        
        )
        t 
    )
)
(define (square-tree x)
    (cond ((null? x) x)
        ((not (pair? x))  (* x x))
        (else (cons (square-tree (car x)) (square-tree (cdr x))))
    )
)

(define (scale-tree2 x factor)
    (map 
        (lambda (sub-tree) (
            if (pair? sub-tree)
                (scale-tree2 sub-tree factor)
                (* sub-tree factor)
            )
        )
        ;// 2 
        x 
    )
)
(define (scale-tree x factor)
    (cond ((null? x) x)     
        ((not (pair? x)) (* x factor))
        (else (cons (scale-tree (car x) factor) (scale-tree (cdr x) factor) ))
        
    )
)


(define (displaynewline x)
    (display x)
    (newline)
)


(define x1 (list (list 1 2) (list 3 4 5) 6 7 8))
(displaynewline x1)
(displaynewline (scale-tree x1 10))
(displaynewline (scale-tree2 x1 10))
; (displaynewline (square-tree x1))
(displaynewline (square-tree-map x1))
(displaynewline (square-tree-proc x1 ))

(displaynewline (subset (list 1 2 3 4)))


