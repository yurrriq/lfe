(defmodule test_lang_clj
  "This is a test of the (lang ...) metadata."
  (lang clj)
  (export (dec 1) (inc 1)))

(defun dec (x)
  "Return a number one less than `x`."
  (-> x (- 1)))

(defun inc (x)
  "Return a number one greater than `x`."
  (->> x (+ 1)))
