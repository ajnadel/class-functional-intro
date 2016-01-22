(define (square x)
  (* x x))
;(* 2 2 2)

(define (sum-of-squares-helper cur upper)
  (if (> cur upper)
      0
      (+ (square cur) (sum-of-squares-helper (+ 1 cur) upper))))

(define (sum-of-squares upper-bound)
  (sum-of-squares-helper 0 upper-bound))

(sum-of-squares 5)