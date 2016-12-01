;; File for testing expansion of function specifications.
;; We specify functions a/0, b/1, c/2, d/2.

(deftype st (tuple 'st (list) (list)))

(defspec (a 0) (() (integer)))

(defspec (b 1) (((any)) 42))

(defspec (c 2)
  (((atom) (integer)) (string))
  )

(defspec (d 2)
  (((atom) (integer)) (string))
  (((pid) (atom)) (st)))

(defspec (e 2)
  ((x y) (tuple 'ok z) ((x (integer)) (y (atom)) (z (any)))))

(defspec (f-1 2)
  ([(lambda ((any)) (boolean)) (list)] (list)))

(defspec (f-2 2)
  ([pred (list)] (list) [(pred (lambda ((any)) (boolean)))]))

;; Bad func specs
;;(defspec (b 1) (((any)) (any)))         ;Respecing (b 1)
;;(defspec (g 2)                          ;Undefined constraints y, z
;;  ((x y) z ((x (integer)))))
