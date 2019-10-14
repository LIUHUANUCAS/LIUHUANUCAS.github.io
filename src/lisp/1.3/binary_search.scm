(display "binary search\n")

(define (half-interval-method f a b)
  (let 
    (
      (a-value (f a))
      (b-value (f b))
    )
  
      (cond 
        (
          (and (negative? a-value) (positive? b-value))
          (search f a b)
        )
        (
          (and (negative? b-value) (positive? a-value))
          (search f b a)
        )
        (else 
          (error "values are not of oppsite sign"  a b)
        )
      )
    )
)

(define (search func a b)
  (let ((mid-point (average a b)))
    (if (close-enough? a b) 
      mid-point
      (
        let 
          ((test-value (func mid-point)))
          (
            cond 
            ((positive? test-value) (search func a mid-point))
            ((negative? test-value) (search func mid-point b ))
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
; (define (add x y)
;     (+ 
;       (let ((a 3))  (+ 0 a) ) x y
;     )
; )

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


(define (displaynewline x)
  (display x)
  (display "\n")
)
; (displaynewline ((lambda (x) (* x x)) 2) )
; (displaynewline (f (lambda (x) (* x (+ 1 x) )) ) ) 

; (displaynewline (add2 100))
; (displaynewline (search (lambda (x) (+ (* x x) (* 2 x ) 1 )) -2 1 ))
; (displaynewline (search sin 2.0 4.0 ))
(displaynewline (half-interval-method sin 2.0 4.0 ))
(displaynewline (half-interval-method (lambda (x) (+ x 2)) -3 4.0 ))
(displaynewline (search (lambda (x ) (+ x 2)) -3 4.0))
