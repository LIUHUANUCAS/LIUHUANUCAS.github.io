(display "hello world\n")
; sqrt with x 
(define (sqrt x) 
  (sqrt-iter 1.0 x)
)

; sqrt-iter with guess x 
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

; x^2
(define (square x )
  (* x x )
)
; abs of number
(define (abs x)
  (if (< x 0 ) 
    (- 0 x) 
    x
  )
)

; improve x with guess 
(define (improve guess x )
  (average guess (/ x guess))
)

; average two number
(define (average a b)
  (/ (+ a b) 2)
)

(define x -9)
(display (abs x))
(display "\nnew  \n")
(display (square (sqrt 1000)))