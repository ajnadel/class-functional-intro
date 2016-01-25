#lang racket

(define (square x)
	(* x x))

;; more obfuscated functions, please
(define (head x) (car x))
(define (tail x) (cdr x))

;; foldl --> (foldl - '(1 2 3) 9)
;; = (((9 - 1) - 2) - 3) = 3
(define (foldl-helper op lst total)
	(if (null? lst)
		total
		(foldl-helper op (tail lst) (op total (head lst)))))

(display "should be 9 ==> ")
(foldl-helper - '(1 2 3) 9)

;; foldr --> (foldr - '(1 2 3) 9) = -7
(define (foldr-helper op lst start)
	(if (null? lst)
		start
		(op (head lst) (foldr-helper op (tail lst) start))))

(display "should be -7 ==> ")
(foldr-helper - '(1 2 3) 9)


;; gets the length of a list
(define (lst-length lst)
	(foldl-helper (lambda (x y) (+ x 1)) lst 0))
(display "should be 5 ==> ")
(lst-length (list 1 3 2 4 3 8)) ; ==> 5

;; gets the lesser of two numbers (or either if the same)
(define (min-of-two x y)
	(if (< x y)
		x
		y))
;; gets the least number of a list of numbers
(define (min-lst lst)
	(foldl-helper min-of-two lst +inf.0))

(display "should be 1 ==> ")
(min-lst (list 7 2 8 3 1 4)) ; ==> 1

;; gets the greater of two numbers (or either if the same)
(define (max-of-two x y)
	(if (> x y)
		x
		y))
;; gets the greatest number of a list of numbers
(define (max-lst lst)
	(foldl-helper max-of-two lst -inf.0))

(display "should be 8 ==> ")
(max-lst (list 7 2 8 3 1 4)) ; ==> 8

(define (id lst)
	(foldl-helper (lambda (arr elem) (cons elem arr)) lst '()))
(id (list 1 2 3))


