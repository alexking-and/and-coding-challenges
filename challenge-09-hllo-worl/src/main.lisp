(defpackage hllo-worl
  (:use :cl)
  (:export :is-word-valid)
  (:export :longest-word))
(in-package :hllo-worl)

(defun is-word-valid (letters word)
  (reduce (lambda (acc cur) (and acc (/= (count cur letters) 0))) (coerce word 'list) :initial-value t))

(defun longest-word (letters dict-path)
  (reduce (lambda (acc cur) (if (and (is-word-valid letters cur) (> (length cur) (length acc))) cur acc)) (uiop:read-file-lines dict-path) :initial-value ""))
