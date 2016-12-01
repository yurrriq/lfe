(defmodule spec-test
  (export (add-2 1)))

(defspec (add-2 1) (((integer)) (integer)))
(defun add-2 (x) (+ x 2))
