(display "hello world\n")
(define (factorial n)
  (if (= n 1) 
      1
      (* n (factorial (- n 1)))
  )
)

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product) 
                  (+ counter 1)
                  max-count
                  )
  )
)

(define (factorial2 n)
  (fact-iter 1 1 n )
)
(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline (factorial 10 ))
(displaynewline (factorial2 10 ))
