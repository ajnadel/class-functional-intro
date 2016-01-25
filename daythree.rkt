#lang racket

(define (square x)
	(* x x))

;; more obfuscated functions, please
(define (head x) (car x))
(define (tail x) (cdr x))

(define (foldr func arr val)
	(if (null? arr)
		val
		(foldl func (cdr arr) (func (car arr) val))))

; (define (foldr func arr val)
; 	(if (null? arr)
; 		val
; 		(foldr func (cdr arr) (func val (car arr)))))

;; won't work because there's no difference between 0-10-5-1 and 0-1-5-10
; (define (foldr-cheating func arr starting-value) (foldl func (reverse arr) starting-value))


;; not working yet
; (define (foldr-helper func old-arr new-value)
; 	(if (null? old-arr)
; 		new-value
		
; (define (foldr func arr starting-value)
; 	(foldr-helper func arr (list starting-value)))
; (println "(foldl - '(10 5 1) 0)")
(foldr - '(10 5) 0)

;; not sure if there is a preferred way to do this
(define (fib n) 
	(if (< n 1)
		0
		(if (= n 1)
			1
			(+ (fib (- n 1)) (fib (- n 2))))))

(println "fib(0-10)")
(for ([i (in-range 10)])
    (println (fib i)))
