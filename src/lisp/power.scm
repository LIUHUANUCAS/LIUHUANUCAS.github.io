(display "power(x,n) = x^n\n")
(define (exprt x n)
    (if (= n 0)
        1 
        (* x (exprt x (- n 1)))
    )
)

(define (power x n)
    (if (= n 0)
        1
        (expr-iter n x 1)
    )
)

(define (expr-iter count base product )
    (if (= count 0) 
        product
        (expr-iter (- count 1) base (* base product))
    )
) 

(define (fast-expr base n)
    (cond 
            ((= n 0) 1)
            ( (even? n )(square (fast-expr base (/ n 2))))
            (else (* base (fast-expr base (- n 1))))
    )
)

(define (even? n) 
    (= (reminder n 2 ) 0)
)

(define (reminder n x)
    (if  (< n x) x
        (reminder (- n x) x)
    )
)

(define (fast-iter2 b n a)
    (cond 
            ((= n 0) a)
            ((= n 1) (* a b))
            ( (even? n) (fast-iter2 (* b b) (/ n 2) a) )
            (else (fast-iter2 b (- n 1) (* a b)))
    )
)

(define (power2 b n)
    (fast-iter2 b n 1)
)
(define (displaynewline x) 
  (display x)
  (display "\n")
)

(define x 31)
(define n 37)
(displaynewline (exprt x n))
(displaynewline (power x n))
(displaynewline (fast-expr x n))
(displaynewline (power2 x n))


(define (* a b)
    (if (= b 0) 0
        (+ a (* a (- b 1 )))
    )
)
(define (double x)
    (+ x x)
)

(define (halve x)
    (/ x 2)
)

(define (mul-iter a b c)
    (cond 
        ((=  b 1) c)
        ( (even? b ) (mul-iter  a (halve b) (double c)) )
        (else (mul-iter a (- b 1) (+ a c)))
    )
)

(define (mul a b)
    (mul-iter a b a)
)
(define a 2)
(define b 1)
(displaynewline (* a b))
(displaynewline (mul a b))
