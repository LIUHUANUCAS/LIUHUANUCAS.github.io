(display "rational number\n")

(define (rect-area rect)
  (
    let(
          (c1 (abs(- (x-point (end-segment rect)) (x-point (start-segment rect)) )))
          (c2 (abs(- (y-point (end-segment rect)) (y-point (start-segment rect)) )))
          
        )   
        (* c1 c2)
  )
)
(define (make-rectangle x1 y1 x2 y2)
  (make-segment x1 y1 x2 y2)
)

(define (make-segment a b x y)
    ( cons (make-point a b)  (make-point x y) )
)
(define (make-seg x y)
  (cons x y)
)

(define (start-segment s)
  (car s)
)
(define (end-segment s)
  (cdr s)
)

(define (make-point x y)
  (cons x y)
)

(define (averge x y)
  (/ (+ x y) 2)
)

(define (mid-segment s)
  (let 
    (
      (x (start-segment s))
      (y (end-segment s))
    )
    (make-point (averge (x-point x) (x-point y) ) (averge (y-point x) (y-point y))  )
  )
)

(define (x-point p)
  (car p)
)


(define (y-point p)
  (cdr p)
)

(define (print-segment s)
  (display "[")

  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (display "]")

  (newline)
)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  ; (newline)

)



(define (displaynewline x) 
  (display x)
  (display "\n")
)


; (print-point (make-segment 1 2 3 4))
; (print-segment (make-segment 1 2 3 4))
(print-point (make-point 1 2))
(newline)
(print-segment ( make-seg (make-point 1 2) (make-point 3 4) ))
; (print-segment ( make-segment 1 2 3 4))
(define p (make-segment 1 2 3 4))

(print-point (mid-segment p))
(newline)
(define rect (make-rectangle 1 1 3 4))
(print-segment rect)
(display "areax=")
(displaynewline  (rect-area rect))

