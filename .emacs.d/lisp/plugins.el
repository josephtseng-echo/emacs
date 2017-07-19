(use-package auto-compile
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package linum
  :init (global-linum-mode t)
  :config
  (setq linum-format "%6d ")
  )

(use-package exec-path-from-shell :init (exec-path-from-shell-initialize))

;; key bindings
(use-package general
  :config
  ;; global keys
  (general-define-key
   "M-x" 'helm-M-x
   "C-c M-x" 'execute-extended-command
   "C-x b" 'helm-mini
   "C-x C-b" 'helm-buffers-list
   "C-x C-f" 'helm-find-files
   "M-:" 'helm-eval-expression-with-eldoc)
  ;; insert keys
  (general-define-key
   :states '(insert)
   "M-y" 'helm-show-kill-ring
   "TAB" 'helm-company)
  (let ((leader "SPC"))
    ;; normal leader keys
    (general-define-key
     :prefix leader :states '(normal)
     "x" 'helm-M-x
     "p" 'helm-projectile
     "P" 'projectile-command-map
     "f" 'helm-find-files
     "F" 'helm-projectile-find-file-dwim
     "b" 'helm-mini
     "B" 'helm-buffer-list
     "v" 'projectile-vc
     "l" 'find-library
     "h" 'helm-command-prefix
     "b" 'helm-mini
     "o" 'helm-occur
     "m" 'helm-all-mark-rings
     "a" 'helm-ag
     "w" 'visual-line-mode)
    ;; normal and visual leader keys
    (general-define-key
     :prefix leader
     :states '(normal visual))))

;; helm
(use-package helm-ag
  :ensure t
  :after (helm helm-projectile)
  :config
  ;; ripgrep command:
  (setf helm-grep-ag-command
        "rg --smart-case --no-heading --line-number %s %s %s"))

(use-package helm-config :defer 1)

(use-package helm
  :ensure t
  :diminish helm-mode
  :after helm-config
  :bind  (("C-c h" . helm-mini)
          ("C-h a" . helm-apropos)
          ("C-x b" . helm-buffers-list)
          ("C-x C-b" . helm-buffers-list)
          ("C-x C-f" . helm-find-files)
          ("C-x c o" . helm-occur)
          ("M-i" . helm-swoop)
          ;;("C-x c y" . helm-yas-complete)
          ;;("C-x c Y" . helm-yas-create-snippet-on-region)
          ("C-x c SPC" . helm-all-mark-rings)
          ("M-y" . helm-show-kill-ring)
          ("M-x" . helm-M-x))
  :config
  (require 'helm-config)
  (general-define-key
   :keymaps 'helm-map
   "C-c !" 'helm-toggle-suspend-update
   "<tab>" 'helm-execute-persistent-action
   "C-i" 'helm-execute-persistent-action
   "C-z" 'helm-select-action)
  (global-unset-key (kbd "C-x c"))
  (helm-mode))

(use-package helm-swoop)

;; projectile
(use-package helm-projectile
  :ensure t
  :commands helm-projectile-on)


(use-package helm-cscope
  :defer t
  :init
  (add-hook 'python-mode-hook #'helm-cscope-mode)
  :config
  (setq-default cscope-option-do-not-update-database t)
  (dolist (e '(("C-c s =" . helm-cscope-find-assignments-to-this-symbol) ; assignments
               ("C-c s C" . helm-cscope-find-called-function) ; called
               ("C-c s c" . helm-cscope-find-calling-this-funtcion) ; calling
               ("C-c s d" . helm-cscope-find-global-definition) ; definition
               ("C-c s g" . helm-cscope-find-global-definition) ; global
               ("C-c s e" . helm-cscope-find-egrep-pattern) ; egrep
               ("C-c s f" . helm-cscope-find-this-file) ; file
               ("C-c s i" . helm-cscope-find-files-including-file) ; includes
               ("C-c s s" . helm-cscope-find-this-symbol) ; symbol
               ("C-c s t" . helm-cscope-find-this-text-string) ; text
               ("C-c s u" . helm-cscope-pop-mark))) ; pop mark
    (bind-key (car e) (cdr e) helm-cscope-mode-map)
    ;; (bind-key (car e) (cdr e) cscope-minor-mode-map)
    ))

(use-package projectile
  :ensure t
  :commands projectile-mode
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (add-hook 'prog-mode-hook #'projectile-mode)
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package helm-descbinds
  :config (helm-descbinds-mode))

(use-package helm-gtags
  :ensure t
  :after helm
  :commands helm-gtags-mode
  :bind (("M-." . helm-gtags-dwim)
         ("M-," . helm-gtags-pop-stack)
         ("M-r" . helm-gtags-find-rtag))

  :config
  (setq helm-gtags-auto-update t))

(use-package helm-gitignore)

;; theme
;;(use-package zenburn-theme :ensure t)
;(use-package zenburn-theme
;  :ensure t
;  :config
;  (load-theme 'zenburn t))
;
(setq color-themes '())
(use-package color-theme-solarized
  :config
  (customize-set-variable 'frame-background-mode 'dark)
  (load-theme 'solarized t))

;; powerline
(use-package powerline)

;; highlight changes
(use-package git-gutter
  :diminish git-gutter-mode
  :config (global-git-gutter-mode))

;;; behavior
;; smooth scrolling
(use-package smooth-scroll
  :if (display-graphic-p)
  :diminish smooth-scroll-mode
  :config
  (setq smooth-scroll/vscroll-step-size 8)
  (smooth-scroll-mode))


;; adaptive word wrapping
(use-package adaptive-wrap
  :config (adaptive-wrap-prefix-mode))

;; ag - the silver searcher
(use-package ag
  :commands (ag ag-files ag-regexp ag-project ag-dired helm-ag)
  :config (setq ag-highlight-search t
                ag-reuse-buffers t))

(use-package helm-ag
  :commands (helm-ag)
  :config
  ;; fix https://github.com/bbatsov/projectile/issues/837
  (setq grep-find-ignored-files nil
        grep-find-ignored-directories nil))

;; anzu
(use-package anzu
  :commands (isearch-foward isearch-backward)
  :config (global-anzu-mode))

;; company "complete anything"
(use-package company
  :ensure t
  :diminish company-mode
  :commands (company-complete company-mode)
  :init
  (add-hook 'prog-mode-hook 'company-mode)
  :config
  (use-package company-c-headers)
  (push '(company-clang
          :with company-semantic
          :with company-yasnippet
          :with company-c-headers)
        company-backends))

(use-package helm-company
  :commands (helm-company)
  :config (company-mode))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode)
  :init
  (progn
    (require 'cl)))

;; popwin
(use-package popwin
  :config (popwin-mode))

;; regex tool
(use-package regex-tool
  :commands (regex-tool))

;; save kill ring
(use-package savekill)

;; saveplace
(use-package saveplace
  :config
  (setq-default save-place t
                save-place-file (f-expand "saved-places" user-emacs-directory)))
;; scratch
(use-package scratch
  :commands (scratch))

;; slime
(use-package sly
  :commands (sly)
  :config (setq inferior-lisp-program (executable-find "sbcl")))

(use-package smartparens
  :ensure smartparens
  :commands (smartparens turn-on-smartparens-strict-mode)
  :bind (("C-d" . sp-delete-char)
         ("C-M-f" . sp-forward-sexp)
         ("C-M-b" . sp-backward-sexp)
         ("C-M-k" . sp-kill-sexp)
         ("C-M-e" . sp-up-sexp)
         ("C-M-n" . sp-next-sexp)
         ("C-M-p" . sp-previous-sexp)
         ("C-M-s" . sp-unwrap-sexp)
         ("C-M-t" . sp-transpose-sexp)
         ("C-M-<backspace>" . sp-backward-unwrap-sexp)
         ("C-M-w" . sp-copy-sexp)
         ("C-<right>" . sp-slurp-hybrid-sexp)
         ("C-<left>" . sp-forward-barf-sexp)
         ("C-M-<left>" . sp-backward-slurp-sexp)
         ("C-M-<right>" . sp-backward-barf-sexp)
         ("M-F" . sp-forward-symbol)
         ("M-B" . sp-backward-symbol))
  :config
  (use-package smartparens-config))

;; tramp
(use-package tramp
  :config
  (setq tramp-verbose 9
        tramp-default-method "ssh"
        tramp-ssh-controlmaster-options
        (concat "-o ControlPath=/tmp/tramp.%%r@%%h:%%p "
                "-o ControlMaster=auto "
                "-o ControlPersist=no")))

;; try
(use-package try
  :commands try)

;; undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist
        `(("." . ,(f-expand "undo-tree" user-emacs-directory)))
        undo-tree-auto-save-history t))

;; unfill autofill
(use-package unfill
  :commands (unfill-region unfill-paragraph toggle-fill-unfill))

;; uniquify
(use-package uniquify
  :ensure nil
  :config (setq uniquify-buffer-name-style 'forward))

;; setup virtualenvwrapper
(use-package virtualenvwrapper
  :commands (venv-workon))

;; which-key
(use-package which-key
  :diminish which-key-mode
  :config (which-key-mode))

;; whitespace
(use-package whitespace
  :commands (whitespace-mode)
  :config
  (setq whitespace-style '(face tabs spaces newline empty
                                trailing tab-mark newline-mark)))

(use-package whitespace-cleanup-mode
  :diminish whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode))

;; yasnippet
(use-package yasnippet
  :ensure t
  :commands yas-global-mode
  :init
  (add-hook 'after-init-hook #'yas-global-mode)
  :config
  (setq yas-snippet-dirs (list (expand-file-name
                                (concat user-emacs-directory "snippets"))))
  (add-to-list 'yas-snippet-dirs
               (concat (file-name-directory (locate-library "yasnippet"))
                       "snippets"))

  (add-hook 'html-mode-hook (lambda ()
                              (setq ac-sources '(ac-source-semantic ac-source-yasnippet)))))


;; CMake
(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

;; crontab
(use-package crontab-mode
  :mode "\\.cron\\(tab\\)?\\'")

;; haskell
(use-package haskell-mode
  :mode "\\.\\(?:[gh]s\\|hi\\)\\'"
  :interpreter ("runghc" "runhaskell"))

;; json
(use-package json-mode
  :mode "\\.json$"
  :config (setq js-indent-level 4))

;; less-css
(use-package less-css-mode
  :mode "\\.less\\'")


;; nginx
(use-package nginx-mode
  :mode ("nginx.conf$" "/etc/nginx/.*"))


;; ruby
(use-package ruby-mode)

;; rust
(use-package rust-mode
  :mode "\\.rs\\'"
  :config (use-package flycheck-rust))

;; ssh-config
(use-package ssh-config-mode
  :mode ((".ssh/config\\'"       . ssh-config-mode)
         ("sshd?_config\\'"      . ssh-config-mode)
         ("known_hosts\\'"       . ssh-known-hosts-mode)
         ("authorized_keys2?\\'" . ssh-authorized-keys-mode)))

;; toml
(use-package toml-mode
  :mode "\\.toml$")

;; yaml
(use-package yaml-mode
  :mode "\\.ya?ml\'")

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode))

(use-package web-mode
  :ensure t
  :mode (("\\.erb\\'" . web-mode)
	 ("\\.mustache\\'" . web-mode)
	 ("\\.html?\\'" . web-mode)
         ("\\.php\\'" . web-mode))
  :config (progn
            (setq web-mode-markup-indent-offset 2
		  web-mode-css-indent-offset 2
		  web-mode-code-indent-offset 2)))

(use-package go-mode
  :defer t
  :ensure t
  :mode ("\\.go$" . go-mode))

;;; php mode
(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :config
  (progn
    (add-hook 'php-mode-hook 'smartparens-mode)
    (use-package ac-php
      :ensure t
      :config
      (add-hook 'php-mode-hook
                '(lambda ()
                   (use-package company-php :ensure t)
                   (company-mode t)
                   (add-to-list 'company-backends 'company-ac-php-backend))))
    (use-package php-eldoc
      :ensure t
      :config
      (add-hook 'php-mode-hook 'php-eldoc-enable))))


;;;perl
(use-package cperl-mode
  :defer t
  :ensure t
  :config
  (progn
     (setq cperl-brace-offset 0)

     (setq cperl-indent-level 2
           cperl-close-paren-offset (- cperl-indent-level))

     (setq cperl-continued-brace-offset 0)
     (setq cperl-continued-statement-offset 0)

     (setq cperl-electric-keywords t
           cperl-electric-parens t
           cperl-electric-linefeed t
           cperl-electric-lbrace-space t)

     (when (>= emacs-major-version 24)
       (setq cperl-electric-parens nil
             cperl-electric-lbrace-space nil))

     (setq cperl-merge-trailing-else nil)
     (setq cperl-brace-imaginary-offset 0)
     (setq cperl-indent-parens-as-block t)
     (setq cperl-indent-wrt-brace t)
     (setq cperl-label-offset -2)
     (setq cperl-merge-trailing-else t)
     (setq indent-tabs-mode t)
     (setq tab-width 2)
     ))

(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))


(use-package mozc
  :ensure t
  :defer t
  :config (use-package mozc-popup :ensure t))

;;js
(use-package json-mode
  :defer t
  :ensure t)

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js$"
  :config
  (use-package js2-refactor
    :ensure t
    :commands js2-refactor-mode
    :config
    (js2r-add-keybindings-with-prefix "C-c C-r"))

  (electric-indent-mode -1)
  (setq js2-basic-offset 2)
  (setq js2-bounce-indent-p t)
  (setq js2-consistent-level-indent-inner-bracket-p t)
  (setq js2-pretty-multiline-decl-indentation-p t)
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package coffee-mode
  :ensure t
  :defer t
  :mode "\\.em$"
  :config
  (progn
    (setq tab-width 2)
    (setq coffee-tab-width 2)
    (setq indent-tabs-mode t)
    (add-hook 'before-save-hook
              (lambda ()
                ;; This is a sad hack. coffee-mode indents strictly
                ;; by spaces and I don't have time to patch.
                ;; I need tabs for work standards.
                (tabify-buffer))
              nil t)
    ))

(use-package python
  :mode ("\\.py'" . python-mode)
  :init
  (progn
    (defalias 'python2-mode 'python-mode)
    (defalias 'python3-mode 'python-mode)))

;;lua
(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")

(provide 'plugins)
