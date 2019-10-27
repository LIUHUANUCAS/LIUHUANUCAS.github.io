(display "list proc\n")
(define (reverse-r seq)
    (fold-right (lambda (x y) 
                (   if (null? y) 
                        (list x)
                        (append y (list x))
                ))
        '() seq)
)

(define (reverse-l seq)
    (fold-left (lambda (x y) (cons y x )) '() seq)
)
(define ( fold-right op init seq ) 
        (accumulate op init seq )
)
(define (fold-left op initial seq)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))
        )
    )
    (iter initial seq)
)

; 2.36
(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs))
        )
    )
)

(define (accumulate op initial sequence)
    (if (null? sequence) initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

(define (enumerate-tree tree )
    (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
    )
)

(define (filter predicate sequence)
    (cond ((null? sequence) '())
        (   (predicate (car sequence)) 
            (cons (car sequence) (filter predicate (cdr sequence)))
        )
        (else (filter predicate (cdr sequence)))
        )
)

; 2.37
(define (matrix-*-vector m v)
    (map (lambda (mi) (dot-product mi v) ) m)
)
(define (vector-*-matrix v m)
    (map (lambda (mi)  (dot-product mi v)) m)
)
(define (transpose m)
    (accumulate-n cons '() m)
)
(define (matrix-*-matrix m n)
    (
        let ((cols (transpose n)))
        (map  (lambda (x) (matrix-*-vector cols x)) m)

    )
)
(define (dot-product v w)
    (accumulate + 0 (map * v w))
)
(define (displaynewline x)
    (display x)
    (newline) 
)

(define n (list (list 1 2 ) (list  3  4) (list 1 2)  (list 3 4)))
(define v (list 1 2 3 4) )
(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9) ))
(displaynewline (matrix-*-vector m v))
(displaynewline (transpose m))
(displaynewline (transpose n))
(display "m:")
(displaynewline m)
(display "n:")
(displaynewline n)
(displaynewline (transpose n))
(displaynewline (matrix-*-matrix m n))
(displaynewline (matrix-*-vector m (car (transpose n))))
(displaynewline (matrix-*-vector   (transpose n) (car m) ))
(displaynewline ( fold-left / 1 (list 1 2 3)))
(displaynewline ( fold-right / 1 (list 1 2 3)))
(displaynewline ( accumulate / 1 (list 1 2 3)))
(define zz (list 1 2 3 4 5 6 7))
(displaynewline ( reverse-r zz ))
(displaynewline ( reverse-l zz ))

