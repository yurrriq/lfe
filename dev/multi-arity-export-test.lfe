(defmodule multi-arity-export-test
  (export* (f 1 2 3)))

(defun f (x)     (lfe_io:format "f/1 -> ~p\n"    (list x)))
(defun f (x y)   (lfe_io:format "(f ~p ~p)\n"    (list x y)))
(defun f (x y z) (lfe_io:format "(f ~p ~p ~p)\n" (list x y z)))
