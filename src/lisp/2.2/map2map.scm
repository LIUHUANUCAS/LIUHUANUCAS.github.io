(display "map call map\n")


(define (flatmap proc seq) 
    (accumulate append '() (map proc seq))
)

(define (enumerate-interval low high)
    (if (> low high)
        '()
        (cons low (enumerate-interval (+ 1 low) high))
    )
)
(define (accumulate op initial sequence)
    (if (null? sequence) initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)
(define (displaynewline x)
    (display x)
    (newline)
)
(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)
(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair)))
)

(define (filter predicate sequence)
    (cond ((null? sequence) '())
        (   (predicate (car sequence)) 
            (cons (car sequence) (filter predicate (cdr sequence)))
        )
        (else (filter predicate (cdr sequence)))
        )
)


(define (prime? n)
    (= n (smallest-divisor n))
)
(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond   
            ( (> (square test-divisor) n) n)
            ( (divides? test-divisor n) test-divisor )
            (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (divides? a b)
    (= 0 (remainder b a))
)

(define (square x)
    (* x x)
)

(define (prime-sum-pair n)
    (map make-pair-sum 
            (filter prime-sum? 
                        (flatmap 
                                (lambda (i) ( map 
                                                (lambda (j) (list i j))   
                                                (enumerate-interval 1 (- i 1)) 
                                            )
                                ) 
                                (enumerate-interval 1 n)
                        ) 
            )
            
            
    )
)
(displaynewline (map (lambda (x) (list x)) (enumerate-interval 1 10)))
(define x (map 
                (lambda (i) 
                        (
                            map (lambda (j) (list i j)) (enumerate-interval 1 i)
                        ) 
                )
                (enumerate-interval 1 10)))

; (displaynewline x)
(displaynewline (prime-sum-pair 6))