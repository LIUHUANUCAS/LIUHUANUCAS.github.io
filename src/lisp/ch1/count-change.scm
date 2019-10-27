(display "count-change\n")

(define (count-change amount)
        (cc amount 5)
) 
(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1) ; base case 1
          ((< amount 0) 0) ; base case 2
          ((= kinds-of-coins 0) 0 ) ; base case 3
          ((+ (cc amount  ; decrese with kinds-of-coins + decrease with some amount of coin change
                   (- kinds-of-coins 1))
               (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
            )
          )
    )
)


; kinds of coins with cent 1$=100cent
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1 ) 1)
        ((= kinds-of-coins 2 ) 5)
        ((= kinds-of-coins 3 ) 10)
        ((= kinds-of-coins 4 ) 25)
        ((= kinds-of-coins 5 ) 50)
  )
)


(define (displaynewline x) 
  (display x)
  (display "\n")
)
(displaynewline (count-change 50 ))
(displaynewline (count-change 400 ))
