;;; env.el --- 
;;
;; Filename: env.el
;; Author: josephzeng <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:25:42 (HKT)


(prefer-coding-system 'utf-8)

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/bin/erlang/bin" exec-path))

(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)

(provide 'env)
