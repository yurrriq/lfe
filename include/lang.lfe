;; Copyright (c) 2016 Eric Bailey
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; File    : lang.lfe
;; Author  : Eric Bailey
;; Purpose : A Racket-inspired #lang macro for LFE.

;; N.B. This mimics (and augments) lfex/kla functionality.
(defmacro |#lang| (mod)
  "Treat all exports from `mod` as if they were built-in."
  `(progn
     ,@(lc ((<- mac (clj:->> (call mod 'module_info 'attributes)
                             (proplists:append_values 'export-macro)))
            (/= '|#lang| mac))
         `(defmacro ,mac args (list* ': ',mod ',mac `(,@args))))
     ,@(flet ((gen-args (n)
                (clj:-> (lambda (arg step)
                          (let (((++* "arg-" str) (atom_to_list arg)))
                            (clj:->> (list_to_integer str)
                                     (+ step) (integer_to_list) (++ "arg-")
                                     (list_to_atom))))
                        (clj:next 'arg-1)
                        (clj:->> (clj:take n)))))
         (lc ((<- `#(,f ,a) (call mod 'module_info 'exports))
              (not (lists:member f
                     '($handle_undefined_function
                       LFE-EXPAND-EXPORTED-MACRO
                       module_info))))
           (let ((args (gen-args a)))
             `(defun ,f ,args (: ',mod ',f ,@args)))))
     ',(list_to_atom (++ "loaded-" (atom_to_list mod) "-lang"))))
