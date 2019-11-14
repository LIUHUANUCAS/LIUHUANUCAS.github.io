(display "binary tree\n")
(define (list-tree element)
    (car (partial-tree element (length element)))
)
(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let 
            ((left-size (quotient (- n 1) 2)))
            (let 
                ((left-result (partial-tree elts left-size)))
                (let 
                    ((left-tree (car left-result))
                        (non-left-elts (cdr left-result))
                        (right-size (- n (+ left-size 1)))
                    )
                    (let
                        ((this-entry (car non-left-elts))
                            (right-result (partial-tree (cdr non-left-elts) 
                                                            right-size)))

                            (let 
                                ((right-tree (car right-result))
                                    (remaining-elts (cdr right-result)))
                                (cons (make-tree this-entry left-tree right-tree) remaining-elts)
                            )

                   )
                )
            )
        )
    )
)
(define (lookup given-key set-of-records) 
    (cond 
        ( (null? set-of-records) '#f )
        ( (equal? given-key  (key (car set-of-records))) (car set-of-records) )
        (else (lookup given-key (cdr set-of-records)))
    )
)
(define (key x)
    x
)
; 2.63
(define (tree->list-1 tree )
    (if (null? tree) 
        '()
        (append (tree->list-1 (left-branch tree))  (cons (entry tree) (tree->list-1 (right-branch tree)) )  )
    )
)

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result-list))  )
        )
    )
    (copy-to-list tree '())
)

; 2.66
(define (lookup-tree x tree)
    (cond 
        ( (null? tree) '#f)
        ( (= x (key (entry tree)) ) (entry tree))
        ((< x (key (entry tree)))  (lookup-tree x (left-branch tree)) )
        ((> x (key (entry tree)))  (lookup-tree x (right-branch tree)) )
    )
)

(define (adjoin-set x set)
    (cond 
        ((null? set) (make-tree x '() '()))
        ((= x (entry  set)) set)
        ((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
        ((> x (entry set)) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))
    )
)
(define (element-of-set? x set)
    (cond 
        ((null? set) '#f )
        ((= x (entry set)) '#t )
        ((< x (entry set)) (element-of-set? x (left-branch set)) )
        ((> x (entry set)) (element-of-set? x (right-branch set)) )
    )
)
(define (right-branch tree)
    ; (car (cdr (cdr tree)))   
    (caddr tree )
    ; car ((left right))
)
(define (left-branch tree)
    ; ( car (cdr tree))
    ( cadr tree)
)
; get root of tree 
(define (entry tree)
    (car tree)
)
; make tree using entry left right 
(define (make-tree entry left right)
    (list entry left right)
)
(define (displaynewline x)
  (display x)
  (newline)
)
(define (add-to-tree tree l)
    (if (null? l)
        tree 
        (add-to-tree (adjoin-set (car l) tree) (cdr l))
    )
)
(define x (make-tree 3 '() '() ))
(displaynewline  x )
(displaynewline "lookup keys")
; (displaynewline (lookup 1 (list 1 2 3 4) ))
 (displaynewline (lookup 7 (list 1 2 3 4) ))
(displaynewline (equal? 3 3 ))
(displaynewline (cdr  '(1 4) ))

(displaynewline  (element-of-set?  1 x ))

(define x (adjoin-set 1 x ))
(define x (adjoin-set 7 x ))
(define x (adjoin-set 1 x ))
(define x (adjoin-set 10 x ))
(define x (adjoin-set -2 x ))
(displaynewline  x )
(displaynewline "lookup tree")

(displaynewline (lookup-tree 5 x))

(displaynewline  (tree->list-1 x ))
(displaynewline  (tree->list-2 x ))

(displaynewline (tree->list-1 (add-to-tree '() (list 7 3 9 1 5 11))))
(displaynewline (tree->list-2 (add-to-tree '() (list 7 3 9 1 5 11))))

(displaynewline (tree->list-1 (add-to-tree '() (list  3  1 7 5 9 11))))
(displaynewline (tree->list-2 (add-to-tree '() (list  3  1 7 5 9 11))))

(displaynewline (tree->list-1 (add-to-tree '() (list  5 3   9 1 7 11))))
(displaynewline (tree->list-2 (add-to-tree '() (list  5 3   9 1 7 11))))
(displaynewline (list-tree (list 1 3 5 7 9)))

