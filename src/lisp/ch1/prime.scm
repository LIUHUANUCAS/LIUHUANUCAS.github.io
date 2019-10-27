(display "isprime(x) prime number\n")
(define (runtime) (tms:clock (times)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)
(define (start-prime-test n start-time)
    (if (isprime n)
        (report-prime (- (runtime) start-time))
    )
)

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

(define (primetest n start-time) 
    (if (isprime? n) (T)
        (F)
    )
)

(define (report-time start-time )
    (report-prime (- (runtime) start-time))
)

(define (fortest n )
    (cond ((< n 3) (T))
        ((if (isprime n) (T)))
        ; (if (isprime n) (displaynewline n))
        (else (fortest (- n 1) ) ）)
    )
)



(define (F)
    (= 1 2)
)

(define (T)
    (= 1 1)
)
(define (fast-prime? n times)
    (cond ((= times 0) (T))
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else (F))
    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )
    (try-it (+ 1 (random (- n 1))))
)



(define (expmod base exp m)
    (cond 
        ((= exp 0) 1 )
        ((even? exp) 
            (remainder (square (expmod base (/ exp 2) m )) m)
        )
        (else (remainder (* base (expmod base (- exp 1) m) ) m))
    )
)


(define (isprime n)
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


; (define (reminder n x)
;     (if  (< n x) n
;         (reminder (- n x) x)
;     )
; )

(define (displaynewline x) 
  (display x)
  (display "\n")
)

(define n 10987)
(displaynewline (isprime n))
(displaynewline (fast-prime? n 100))
(displaynewline (smallest-divisor 199))
(displaynewline (smallest-divisor 1999))
(displaynewline (smallest-divisor 19999))


(define (search-for-primes n start-time)
    ; (define start-time (runtime))
    ; (display (isprime n))
    (display (runtime))
    (newline)
    (fortest n )
    (display (runtime))
    (newline)


    (report-time start-time)
)

; (timed-prime-test n)
 (search-for-primes 1000 (runtime))
