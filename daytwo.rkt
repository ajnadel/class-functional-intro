#lang racket

(define (square x)
	(* x x))

(define (sum-arr x)
	(if (= 0 (length x))
		0
		(+ (car x) (sum-arr (cdr x)))))

(sum-arr '(1 2))

(define (map arr func)
	(if (null? arr)
		(list)
		(cons (func (car arr)) (map (cdr arr) func))))

(map '(1 2 3) square)

(define (fold func arr val)
	(if (null? arr)
		val
		(fold func (cdr arr) (func val (car arr)))))

(fold cons '(1 2 3 4) '())

;(cons 1 '(1 2) '()

;(car (list 1 2 3))

;(define (fold-map func)
; (map