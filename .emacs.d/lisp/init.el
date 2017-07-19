(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst my-emacs-path "~/.emacs.d/" "my emacs config file path")
(defconst my-emacs-vendor-lisps-path (concat my-emacs-path "site-lisp/") "the vendor lisp package")

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)

(use-package dash
  :ensure t
  :config (dash-enable-font-lock))

(use-package f
  :ensure t)


(require 'base)
(require 'plugins)
(require 'func)
(require 'shortcuts)
(provide 'init)
