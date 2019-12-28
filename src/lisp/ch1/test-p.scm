(display "hello world\n")

(define (p) (p))

(define (test x y)
  (if (= x 0)
    x
    y
  )
)

(define (sqrt x) 

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001)
  )

  (define (improve guess)
    (average guess (/ x guess))
  )

  (define (sqrt-iter guess  )
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess ))
    )
  )
  (sqrt-iter 1.0)
)

(define (square x )
  (* x x )
)

(define (average a b)
  (/ (+ a b) 2)
)
(define (new-if predicate then-clause else-clause)
  (cond 
    (predicate then-clause)
    (else else-clause)
  )
)

;(test 0 (p))
(define x -9)
(display (abs x))
(display "\nnew  \n")
(display (sqrt 119))
(newline)
(define z (new-if '#t 3 5))

(display z)
(newline)
(display (< 1 2))