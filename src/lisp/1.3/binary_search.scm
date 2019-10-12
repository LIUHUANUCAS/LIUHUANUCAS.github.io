(display "binary search\n")


(define (search f a b)
  (let ((mid-point (average a b)))
    (if (close-enough? a b) 
      mid-point
      (
        let 
          ((test-value (f mid-point)))
          (
            cond 
            ((positive? test-value) (search f a mid-point))
            ((negative? test-value) (search f mid-point b ))
            (else mid-point)
          )
      )
    )
  )
)
(define (close-enough? x y) 
  (< (abs (- x y)) 0.001 )
)

(define (average x y)
  (/ (+ x y) 2)
)
(define (add x y)
    (+ 
      (let ((a 3))  (+ 0 a) ) x y
    )
)

(define (positive? x)
  (> x 0)
)

(define (negative? x)
  (< x 0)
)

(define (sign x) 
  (cond ((positive? x) 1)
    ((negative? x) -1)
    (else 0)
  )
)



(define (square x) (* x x))
(define (f g)
    (g 2)
)

(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline ((lambda (x) (* x x)) 2) )
; (displaynewline (f f))
(displaynewline (f (lambda (x) (* x (+ 1 x) )) ) ) 
(displaynewline (add 1 6))
(define (add2 x )

(+ (let ((x 3)) 
    (+ x (* x 10))
    )
     x)
)

(displaynewline (add2 100))
(displaynewline (search (lambda (x) (+ (* x x) (* 2 x ) 1 )) -2 1 ))
(displaynewline (search sin 2.0 4.0 ))
