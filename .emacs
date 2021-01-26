;;; .emacs ---
;;
;; Filename: .emacs
;; Author: josephzeng <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:42:21 (HKT)

(when (version< emacs-version "26.3")
  (message "Your Emacs is old"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(load "init")
