#lang racket

(define (square x)
	(* x x))

;; more obfuscated functions, please
(define head car)
(define tail cdr)

; (define (merge-sort arr)


(define (merge-helper list-a list-b new-list)
	(if (null? list-a)
		(if (null? list-b)
			new-list ; both lists null, end everything
			(merge-helper list-a (tail list-b) (cons (head list-b) new-list))) ; continue with elem from b
		(if (null? list-b)
			(merge-helper (tail list-a) list-b (cons (head list-a) new-list)) ; continue with elem from a
			(if (< (head list-a) (head list-b)) ; is a[0] less than b[0]
				(merge-helper (tail list-a) list-b (cons (head list-a) new-list)) ; if so, continue with elem from b
				(merge-helper list-a (tail list-b) (cons (head list-b) new-list)))))) ; otherwise, continue with elem from b

(define (merge list-a list-b) (reverse (merge-helper list-a list-b (list))))

(merge (list 1 3 8) (list 2 4 5))

(define (first-half-length lst) (exact-ceiling (/ (length lst) 2)))
; (define (second-half-length lst) (- (length lst) (first-half-length lst)))

(define (first-half lst) (take lst (first-half-length lst)))
(define (second-half lst) (list-tail lst (first-half-length lst)))

(first-half (list 1 2 3 4 5))
(second-half (list 1 2 3 4 5))


(define (merge-sort lst)
	(if (> (length lst) 1)
		(merge (merge-sort (first-half lst)) (merge-sort (second-half lst)))
		lst)) ; return the list if only one elem

(display "\nmerge sort:\n")
(merge-sort (list 1 3 2 50 4 7)) ; ==> '(1 2 3 4 7 50)