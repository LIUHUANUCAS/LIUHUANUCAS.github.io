


(define (square x )
  (* x x)
)

(define (abs x)
  (if (< x 0) 
    (- x)
    x
  )
)

(define (average a b)
  (/ (+ a b) 2.0)
)

(define (improve guess x )
  (average guess (/ x guess))
)

(define (square x )
  (* x x )
)


; (define x -9)
(display (abs -9))
(display "\n")
(display (average 1 2))
(display "\n")
(display (improve 1.0 3))
(display "\n")
(display (square 1.5))
; (sqrt 10)