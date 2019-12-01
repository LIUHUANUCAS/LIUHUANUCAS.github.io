(display "monte carlo integral\n")
(define (square x)
    (* x  x)
)
(define (estimate-pi-integral ratio w h r); pi*r^2/(w*h) = ratio
    (/ (* w h ratio 1.0) (square r))
)

;3.5
(define (monte-carlo-integral P x1 y1 x2 y2 count)
    (let    ((w (- x2 x1)); width
             (h (- y2 y1)); hight
             (midy (/ (+ y2 y1) 2)); midy
             (midx (/ (+ x2 x1) 2)); midx
             (r (/ (min (- x2 x1) (- y2 y1) ) 2.0) ) ; r for circle radius
            )
        (define (experiment)
            (let 
                ((x (random-in-range x1 x2))
                 (y (random-in-range y1 y2)))
                (P (- x midx) (- y midy) r); (x-midx)^2 + (y-midy)^2 <= r^2
            )
        )
        (estimate-pi-integral (monte-carlo count experiment) w h r)
    )
)


(define (P-circle x y r)
    (<= (+ (square x) (square y) ) (square r))
)
(define (one-circle x y )
    (let 
            ( (x-sq (square x))
            (y-sq (square y)))
            (<= (+ (x-sq y-sq ) 1))
    )
)



(define (random-in-range low high)
    (let 
        ((range (- high low)))
        (+ low (random range))
    )
)

(define (random-update x ) 
    (random (expt 2 31))
)
(define (random-init) 
    (random-update 0)
)
(define (rand)
    (let 
        ((x random-init))
        ((lambda () (set! x (random-update x) ) x))
    )
)

(define (estimate-pi trials)
    (sqrt (/ 6 (monte-carlo trials cesaro-test)))
)

(define (cesaro-test)
    (= (gcd (rand) (rand)) 1)
)
 
(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
        (cond 
            ((= trials-remaining 0) (/ trials-passed trials))
            ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
            (else (iter (- trials-remaining 1) trials-passed))
        )
    )
    (iter trials 0)
)

(define (displaynewline x)
    (display x)
    (newline)
)

(displaynewline (rand))
(displaynewline (estimate-pi (expt 2 10)))
(displaynewline (random-in-range 10 100))

(displaynewline "second")
(define times 1000000)
; P x1 y1 x2 y2
(displaynewline (monte-carlo-integral P-circle -100 0  40.0 100.0 times))
(displaynewline (estimate-pi times))

