(display "binary search\n")


(define (add x y)
    (+ 
      (let ((a 3))  (+ 0 a) ) x y
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
