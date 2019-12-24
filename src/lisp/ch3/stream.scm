(display "stream \n")
(define (displaynewline x)
    (display x)
    (newline)
)

(define (cons-stream a b )
    (cons a (delay-stream b))
)
(define (stream-car stream)
    (car stream)
)

(define (stream-cdr stream)
    (force (cdr stream))
)

(define (force delayed-object)
    (delayed-object)
)

(define (delay-stream object)
    (lambda () object)
)
(define (stream-ref s n)
    (if (= n 0)
        (stream-car s)
        (stream-ref (stream-cdr s) (- n 1))
    )
)

(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))
    )
)
(define the-empty-stream '() )
(define (stream-null? s)
    (null? s )
)
(define (stream-for-each proc s)
    (if (stream-null? s)
        'done
        (begin (proc (stream-car s)) (stream-for-each proc (stream-cdr s)))
    )
)


(define (stream-filter pred stream)
        (cond 
            ((stream-null? stream) the-empty-stream)
            ((pred (stream-car stream)) (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream))))
            (else (stream-filter pred (stream-cdr stream)))
        )
)

(define (display-stream s)
    (stream-for-each displaynewline s)
)
;----------------------stream end--------------
(define (stream-enumerate-interval low high)
    (if (> low high)
        the-empty-stream
        (cons-stream low (stream-enumerate-interval (+ 1 low) high))
    )
)
(define (sum-primes a b)
    (define (iter count accum)
        (cond ((> count b) accum)
            ((prime? count) (iter (+ count 1) (+ count accum)))
            (else (iter (+ count 1) accum))
            )
    )
    (iter a 0)
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

(define (even? x)
    (= 0 (remainder x 2))
)

(displaynewline (sum-primes 1 10))
(define s (stream-enumerate-interval 10 20))
(display-stream s)
(displaynewline "stream-filter")
; (display-stream (stream-filter even? s))
(display-stream (stream-filter even? s))
; (displaynewline (display-stream (stream-enumerate-interval 10 20)))

