(display "f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3) if n >= 3 else n \n")
(define (fn n)
  (if (< n 3) 
      n
      (+  (fn (- n 1)) 
          (* 2 (fn (- n 2)) )
          (* 3 (fn (- n 3)) ) 
      )
  )
)

; f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3)
(define (fn-iter count sum maxcount n3 n2 )
        (if (> count maxcount) 
            sum 
            (fn-iter (+ 1 count) (+ sum (* 2 n2) (* 3 n3)) maxcount n2 sum)
        )
)

(define (fn2 n)
    (if (< n 3)
        n 
        (fn-iter 3 2 n 0 1)
    )
)

(define (displaynewline x) 
  (display x)
  (display "\n")
)

(define x 30)
(displaynewline (fn x ))
(displaynewline (fn-iter 3 2 x 0 1 ))
(displaynewline (fn2 x))
