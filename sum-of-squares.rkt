#lang racket

;; Gets the square of a number x
(define (square x)
  (* x x))
; (* 2 2 2)

; O(n)
(define (sum-of-squares-helper cur upper)
  (if (> cur upper)
      0
      (+ (square cur) (sum-of-squares-helper (+ 1 cur) upper))))

;; Gets the sum of the square of every natural number below and including `upper-bound`
(define (sum-of-squares upper-bound)
  (sum-of-squares-helper 0 upper-bound))

(sum-of-squares 1000000000000)

; O(n)
(define (sum-of-squares-tail-helper cur upper sum)
  (if (> cur upper)
      sum
      (sum-of-squares-tail-helper (+ 1 cur) upper (+ sum (square cur)))))

;; Gets the sum of the square of every natural number below and including `upper-bound`
(define (sum-of-squares-tail upper-bound)
  (sum-of-squares-tail-helper 0 upper-bound 0))

; (sum-of-squares-tail 2)