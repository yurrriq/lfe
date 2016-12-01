;; File for testing expansion of type declarations.

(extend-module ((export-type (o1 1))) ())

;; Some normal attributes.

(extend-module () ((dummy 42)
                   (dummyier (42))))

;; Some records.

(defrecord r1 (a 'hello) b)
(defrecord r2 (a 'hello (atom)) (b 'undefined (record r1)) c)

;; Defining types.

(deftype (t1) (list (integer)))

(deftype (integer x) (tuple 'not-integer (atom) x))

(defopaque (o1 x) (tuple 'not-atom (integer) (integer x)))

(deftype (t3 x y)
  (tuple 'not-atom (bert:integer) (bert:integer x) (bert:integer x y)))

(deftype (t4) (UNION (atom) (pid) 42))

(deftype (t5) (record r1))

(deftype (t6) (record r1 (a (integer)) (b (list))))

(deftype (t7) (lambda ((atom) (atom)) (tuple 't7 (integer))))

(deftype (t8) (lambda any 't8))         ;Any arity

(deftype (t9) (map))                    ;Empty map

(deftype (t10) (map ((integer) (atom)) ((atom) (pid))))

(deftype (t11) (unicode:unicode_binary))

(extend-module ((type ((t11a x) (unicode:unicode_binary x)))) ())

;; Bad type defs.
;;(deftype (t10) 'ok)                     ;Redefining t10
;;(deftype (t12) (sune))                  ;Unknown type (sune 0)
;;(deftype (integer) (tuple 42))          ;Redefining predefined type
;;(deftype (t13 a 1) (list a))            ;Bad parameter list
;;(deftype (t14 a b) x)                   ;Bad type x, 'x or (x)
