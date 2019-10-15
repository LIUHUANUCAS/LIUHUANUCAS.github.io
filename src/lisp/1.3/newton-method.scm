(display "newton to search root of f(x)\n")

(define (newton-method f x)
  (fix-point (newton-transform f) x)
)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x) )) )
)


(define dx 0.00001)
(define (deriv g) 
   (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)) 
)
(define (cube x)
  (* x x x)
)


(define (displaynewline x)
  (display x)
  (display "\n")
)

(displaynewline ((deriv cube) 5 ) )

(define (square x)
  (* x x)
)

(define tolerance 0.001)
(define (fix-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  (define (try guess)
    (
      let ((next (f guess)))
      (if (close-enough? next guess)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

(define (sqrt x)
(newton-method (lambda (y) (- (square y) x)) 1.0)
)
(displaynewline  (sqrt 2.0))
