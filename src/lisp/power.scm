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
    (cond ((= n 0) 1)
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
(define (displaynewline x) 
  (display x)
  (display "\n")
)

(define x 97)
(define n 31)
(displaynewline (exprt x n))
(displaynewline (power x n))
(displaynewline (fast-expr x n))


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
(define a 21)
(define b 100)
(displaynewline (* a b))
(displaynewline (mul a b))

