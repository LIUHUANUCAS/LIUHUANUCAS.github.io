(display "hello world\n")
(define (fib  n)
  (if (< n 2) n
  (+ (fib (- n 1))  (fib (- n 2)) )
  )
)
(define (add a b)
  (+ a b)
)
(display (fib 10) )
(display "\n")
(display (add 4 5))
(display "\n")
(define (sqrt x) 
  (sqrt-iter 1.0 x)
)

(define (sqrt-iter guess x )
  (if (good-enough? guess x )
    guess
    (sqrt-iter (improve guess x ) x)
  )
)

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
    0.001
  )
)

(define (square x )
  (* x x )
)

(define (abs x)
  (if (< x 0 ) 
    (- 0 x) 
    x
  )
)

(define (improve guess x )
  (average guess (/ x guess))
)

(define (average a b)
  (/ (+ a b) 2)
)
(define x -9)
(display (abs x))
(display "\nnew  \n")
(display (sqrt 234091))