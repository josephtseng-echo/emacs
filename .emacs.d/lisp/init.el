;;; init.el ---
;;
;; Filename: init.el
;; Author: josephzeng  <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:25:54 (HKT)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;; package manger
(require 'package)
(setq package-enable-at-startup nil)

;; Add useful package repo
(unless (assoc-default "melpa" package-archives)
    (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t))
(unless (assoc-default "org" package-archives)
    (add-to-list 'package-archives '("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/") t))
(unless (assoc-default "marmalade" package-archives)
    (add-to-list 'package-archives '("marmalade" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))
(unless (assoc-default "gnu" package-archives)
    (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(package-initialize)

;; Install use-package if not available
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
	  (package-install 'use-package))

(eval-when-compile
    (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(setq warning-minimum-level :emergency)

;;;
(if (not (display-graphic-p))
    (progn
      (setq gc-cons-threshold (* 8192 8192))
      (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
      ))(if (not (display-graphic-p))
    (progn
      (setq gc-cons-threshold (* 8192 8192))
      (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
      ))

;;;
(require 'env)
(require 'base)
(require 'plugins)
(require 'utils)
(provide 'init)
