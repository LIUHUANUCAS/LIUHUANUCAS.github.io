(display "abstract function\n")

(define (cube x)
    (* x x x)
)
; sum of [a b]
(define (sum-int a b) 
    (if (> a b) 
        0
        (+ a (sum-int (+ 1 a) b))
    )
)

; sum of cube [a,b]
(define (sum-cube a b)
    (if (> a b)
        0
        (+ (cube a) (sum-cube (+ 1 a) b))
    )
)
; sum of 1/(1*3) + 1/(5*7) + 1/(9*11) is nearly equal to pi/8
(define (pi-sum a b)
    (if (> a b)
        0
        (+ (/ 1.0 (* a (+ 2 a))) (pi-sum (+ 4 a) b))
    )
)

(define (sum term a next b) 
    (if (> a b)
        0 
        (+ (term a) (sum term (next a) next b))
    )
)

(define (indentity x) x)
(define (inc x) (+ 1 x))
(define (sum-int-new a b )
    (sum indentity  a inc b)
)

(define (sum-cube-new a b )
    (sum cube  a inc b)
)

(define (pi-sum-new a b )
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2)))
    )
    (define (pi-next x)
        (+ x 4)
    )
    (sum pi-term  a pi-next b)
)
(define (integral f a b dx)
    (define (add-dx a) (+ a dx))
    (* (sum f (+ a (/ dx 2)) add-dx b) dx)
)
(define (pre-num a b n)
    (/ (- b a) n)
)
(define (sum-a-b a b s)
    (+ a b sum)
)
(define (even? n)
    (= 0 (remainder n 2))
)

(define (anum n)
    (if (even? n) 
        4
        2
    )
)

(define (step a h k)
    (+ a (* k h))
)

(define (t-next b) 

)

(define (integral-new f a b n)
    (define (h)
        (pre-sum a b n)
    )
    (define (t-next x) 
        (+ x (h) )
    )
    (define (newf x )
        (f x)
    )
    (* (pre-num a b n) (+  a b (sum f a t-next b )))
)
(define (sum-add a k n)
    (if (> k n) 0
        (+ )
    )

)
(define (them-pson f a b n)
    ()
)
(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline (sum-int 1 100))
(displaynewline (sum-cube 1 100))
(displaynewline (sum-int-new 1 100))
(displaynewline (sum-cube-new 1 100))
(displaynewline (* 8 (pi-sum 1 1000000)) )
(displaynewline (* 8 (pi-sum-new 1 1000000)) )
(displaynewline (integral cube 0 1 0.0001) )
(integral-new cube 1 1000 100000)
