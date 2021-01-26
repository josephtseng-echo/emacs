;;; plugins.el ---
;;
;; Filename: plugins.el
;; Author: josephzeng <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:25:09 (HKT)

(setq custom-safe-themes t)

;; doom theme enable
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)

  (if (display-graphic-p)
      (progn
        (doom-themes-neotree-config)
        (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
        (doom-themes-treemacs-config)
        ))
  (doom-themes-org-config))

(if (string-equal system-type "darwin")
    (use-package darkokai-theme
      :ensure t
      :config (load-theme 'darkokai t))
  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-nord))
)
;;
; modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
)

;;(use-package zenburn-theme
;;  :ensure t
;;  :config
;;  (load-theme 'zenburn t)
;;)
 
(use-package rainbow-mode
  :config
  (progn
    (defun @-enable-rainbow ()
      (rainbow-mode t))
    (add-hook 'prog-mode-hook '@-enable-rainbow)
))
(use-package rainbow-delimiters
  :config
  (progn
    (defun @-enable-rainbow-delimiters ()
      (rainbow-delimiters-mode t))
    (add-hook 'prog-mode-hook '@-enable-rainbow-delimiters)))

(use-package all-the-icons
  :ensure t
  ;;:after memoize
  :load-path "site-lisp/all-the-icons")

(use-package ace-window)

(use-package magit)

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))

(use-package dashboard
  :ensure t
  :custom-face
  (dashboard-heading ((t (:foreground "#f1fa8c" :weight bold))))
  :config
  (dashboard-setup-startup-hook))
  (setq dashboard-banner-logo-title "welcome.")
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-navigator t)
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents  . 10)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

;;; ============================================
(use-package php-mode
 :ensure t
 :mode
 ("\\.php\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(use-package protobuf-mode)

(use-package dockerfile-mode)

(use-package yaml-mode)

(use-package json-mode)

(use-package emmet-mode)

(use-package web-beautify)

(use-package tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
 
(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t)

(use-package pyvenv)

(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))

(use-package go-mode
  :config
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    ))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(use-package company-go
  :init
  (progn
    (setq company-go-show-annotation t)
    (setq company-tooltip-limit 20)                      ; bigger popup window
    (add-hook 'go-mode-hook 
              (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode)))
    )
  )

(use-package go-eldoc
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    ))

(use-package go-guru
  :defer t
  :hook (go-mode . go-guru-hl-identifier-mode))

;; go get -u -v golang.org/x/tools/cmd/...
;; go get -u -v github.com/rogpeppe/godef
;; go get -u -v golang.org/x/tools/cmd/goimports
;; go get -u -v golang.org/x/tools/gopls
;; go get -u -v github.com/mdempsky/gocode

(use-package scala-mode)

(use-package markdown-mode)

(use-package lua-mode)

(use-package js2-mode)

(use-package perl-mode)

(use-package cperl-mode)

(use-package google-c-style)

(use-package cmake-mode)

(use-package clang-format+
	:config
	(add-hook 'c-mode-common-hook #'clang-format+-mode)
)
;;; ============================================

;;;(use-package aggressive-indent
;;;  :ensure t
;;;  :config
;;;  (global-aggressive-indent-mode 1)
;;;  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;;;)

(use-package smart-tab
  :config
  (progn
    (defun @-enable-smart-tab ()
      (smart-tab-mode))
    (add-hook 'prog-mode-hook '@-enable-smart-tab)
    ))

(use-package which-key
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-bottom)))

(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
          recentf-max-menu-items 15)
    (recentf-mode)
    ))

(use-package linum
  :init
  (progn
    (global-linum-mode t)
    (setq linum-format "%4d  ")
      (set-face-background 'linum nil)
    ))

(use-package autopair
  :config (autopair-global-mode))

(use-package neotree
  :custom
  (neo-theme 'nerd2)
  :config
  (bind-key "C-x n t"    'neotree-toggle)
  (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
    (setq neo-window-fixed-size nil)))

;;ivy swiper counsel
(use-package flx :ensure t)

;;(use-package multiple-cursors :ensure t)

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (:map ivy-mode-map
              ("C-'" . ivy-avy))
  :config
  (setq ivy-wrap t
        ivy-virtual-abbreviate 'full
        ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t
        ivy-count-format "(%d/%d) "
        ivy-re-builders-alist '((read-file-name-internal . ivy--regex-fuzzy)
                                (t . ivy--regex-plus))
        ivy-on-del-error-function nil
        ivy-initial-inputs-alist nil
        enable-recursive-minibuffers t)

  (add-to-list 'ivy-ignore-buffers "\\*Async Shell Command\\*")
  (add-to-list 'ivy-ignore-buffers "\\*Messages\\*")
  (add-to-list 'ivy-ignore-buffers "\\*elfeed-log\\*")
  (add-to-list 'ivy-ignore-buffers "\\*Help\\*")
  (add-to-list 'ivy-ignore-buffers "\\*Compile-Log\\*")
  (add-to-list 'ivy-ignore-buffers "\\*magit-.*")
  (add-to-list 'ivy-ignore-buffers "\\magit-.*")
  (add-to-list 'ivy-ignore-buffers "\\*tide")
  (add-to-list 'ivy-ignore-buffers "\\*Flycheck.*")
  (add-to-list 'ivy-ignore-buffers "\\*lsp-.*")
  (add-to-list 'ivy-ignore-buffers "\\*git-gutter:.*")
  (with-eval-after-load "projectile"
    (setf projectile-globally-ignored-buffers ivy-ignore-buffers))

  (defun conf:ivy-format-function-arrow (cands)
    "Transform CAND-PAIRS into a string for minibuffer."
    (ivy--format-function-generic
     (lambda (str)
       (concat ">> " (ivy--add-face str 'ivy-current-match)))
     (lambda (str)
       (concat "   " str))
     cands
     "\n"))
  (setq ivy-format-function 'conf:ivy-format-function-arrow)
  (ivy-mode 1))

(use-package ivy-prescient
  :ensure t
  :after ivy
  :init (ivy-prescient-mode))

(setq confirm-nonexistent-file-or-buffer t)

(use-package swiper
  :ensure t
  :bind* (("C-s" . swiper)
          ("C-r" . swiper)
          ("C-M-s" . swiper-all))
  :bind
  (:map read-expression-map
        ("C-r" . counsel-expression-history)))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-c b" . counsel-imenu)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-rg) ;;ripgrep
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-h b" . counsel-descbinds)
         ("M-y" . counsel-yank-pop)
         ("M-SPC" . counsel-shell-history))
  :config
)

(use-package ivy-rich
  :ensure t
  :config
  '(ivy-switch-buffer
    (:columns
     ((ivy-rich-candidate (:width 30))  ; return the candidate itself
      (ivy-rich-switch-buffer-size (:width 7))  ; return the buffer size
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
     :predicate
     (lambda (cand) (get-buffer cand)))
    counsel-M-x
    (:columns
     ((counsel-M-x-transformer (:width 40))  ; thr original transfomer
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return the docstring of the command
    counsel-describe-function
    (:columns
     ((counsel-describe-function-transformer (:width 40))  ; the original transformer
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return the docstring of the function
    counsel-describe-variable
    (:columns
     ((counsel-describe-variable-transformer (:width 40))  ; the original transformer
      (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face))))  ; return the docstring of the variable
    counsel-recentf
    (:columns
     ((ivy-rich-candidate (:width 0.8)) ; return the candidate itself
      (ivy-rich-file-last-modified-time (:face font-lock-comment-face))))) ; return the last modified time of the file
  (setq ivy-virtual-abbreviate 'full
        ivy-rich-path-style 'abbrev
        ivy-rich-switch-buffer-align-virtual-buffer t)
  (ivy-rich-mode 1))

(use-package projectile
  :demand
  :bind-keymap ("C-c p" . projectile-command-map)
  :init   (setq projectile-use-git-grep t)
  :config 
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :after counsel projectile
  :hook (prog-mode . counsel-projectile-mode))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :config
  (bind-key [remap completion-at-point] #'company-complete company-mode-map)
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package yasnippet
  :diminish yas-minor-mode
  :init (add-hook 'prog-mode-hook #'yas-global-mode))

(use-package yasnippet-snippets)

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-prefer-searcher 'ag)
  (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure)

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable (expand-file-name "/usr/local/bin/ccls"))
)

;; (use-package eglot
  ;; :config
  ;; (add-hook 'prog-mode-hook 'eglot-ensure))

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp-deferred)
  :custom
  (lsp-enable-snippet t)
  (lsp-auto-guess-root t)
 ( lsp-eldoc-render-all nil)
  (lsp-auto-configure t)
  (lsp-prefer-flymake nil)
  (lsp-keep-workspace-alive t)
  (lsp-enable-xref t)
  (lsp-enable-imenu t)
  (lsp-enable-completion-at-point nil)
  (lsp-keymap-prefix "C-c l")
  (lsp-prefer-capf t)
  (lsp-auto-guess-root t)
  (lsp-keep-workspace-alive nil)
  (lsp-eldoc-enable-hover nil)
  :bind (:map lsp-mode-map
         ("C-c l f" . lsp-format-region)
         ("C-c l t" . lsp-describe-thing-at-point)
         ("C-c l a" . lsp-execute-code-action)
         ("C-c l r" . lsp-rename))
  :config  
  (add-hook 'go-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'rust-mode-hook #'lsp)
  (add-hook 'html-mode-hook #'lsp)
  (add-hook 'js-mode-hook #'lsp)
  (add-hook 'typescript-mode-hook #'lsp)
  (add-hook 'json-mode-hook #'lsp)
  (add-hook 'yaml-mode-hook #'lsp)
  (add-hook 'dockerfile-mode-hook #'lsp)
  (add-hook 'shell-mode-hook #'lsp)
  (add-hook 'css-mode-hook #'lsp)
  (add-hook 'php-mode-hook #'lsp)
  (add-hook 'emacs-lisp-mode #'lsp)

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                    :major-modes '(python-mode)
                    :server-id 'pyls))
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.500) ;; default is 0.2
  (dolist (dir '(".ccls-cache"
                 ".clangd"
                 "data"
                 "bin"))
  )
  ;;(push dir projectile-globally-ignored-directories)
  :commands lsp)

(use-package lsp-ivy
     :after lsp-mode
     :bind (:map lsp-mode-map
            ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)
            ("C-c i" . lsp-ivy-global-workspace-symbol)))

(use-package lsp-ui
  :ensure t
  :custom-face
  (lsp-ui-doc-background ((t (:background ni))))
  :init (setq lsp-ui-doc-enable nil
              lsp-ui-doc-include-signature t               
              lsp-enable-snippet t
              lsp-ui-sideline-enable nil
              lsp-ui-peek-enable nil
              lsp-ui-doc-position              'bottom ;;'at-point
              lsp-ui-doc-header                nil
              lsp-ui-doc-border                "white"
              lsp-ui-doc-include-signature     t
              ;;lsp-ui-sideline-update-mode      'point
              lsp-ui-sideline-delay            1
              lsp-ui-sideline-ignore-duplicate t
              lsp-ui-sideline-enable           nil
              lsp-ui-peek-always-show          nil
              lsp-ui-flycheck-enable           nil
              )
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u m" . lsp-ui-imenu)
			  ("C-c u b" . lsp-ui-peek-jump-backward)
			  ("C-c u f" . lsp-ui-peek-jump-forward)
			  )
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(setq lsp-prefer-capf t)

(use-package browse-kill-ring
  :ensure t
)
(setq browse-kill-ring-highlight-current-entry t
      browse-kill-ring-display-duplicates nil)
(browse-kill-ring-default-keybindings)
(bind-key "C-n"      'browse-kill-ring-forward browse-kill-ring-mode-map)
(bind-key "C-p"      'browse-kill-ring-previous browse-kill-ring-mode-map)
(bind-key "C-g"      'browse-kill-ring-quit browse-kill-ring-mode-map)
(bind-key "<escape>" 'browse-kill-ring-quit browse-kill-ring-mode-map)
(bind-key "C-x y"    'browse-kill-ring)

;;
(setq winner-dont-bind-my-keys t)
(winner-mode t)

(use-package header2
  :ensure t
)
(setq time-stamp-active t)
(setq time-stamp-line-limit 11)
(setq time-stamp-start "[lL]ast[ -][uU]pdate[ \t]*:?")
(setq time-stamp-end "\n")
(setq time-stamp-format " %Y-%02m-%02d %02H:%02M:%02S (%Z)")
(setq header-date-format " %Y-%02m-%02d %02H:%02M:%02S (%Z)")
(add-hook 'before-save-hook 'time-stamp)
(setq make-header-hook '(header-title
                            header-blank
                            header-file-name
                            header-author
                            header-creation-date
                            header-modification-date
                            header-modification-author
                            header-update-count
                            header-description
                            header-copyright
                            header-status
))
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)

(add-to-list 'load-path (concat user-emacs-directory "site-lisp/doxymacs/"))
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(use-package htmlize
  :pin melpa
  :ensure t
  :defer t
)

(setq org-todo-keywords
      (quote ((sequence "TODO(t!/!)" "STARTED(s!/!)" "DOING(i!/!)" "|" "DONE(d!/!)")
			                (sequence "WAITING(w@!/!)" "|" "ABORT(c@!/!)"))))
(setq org-enforce-todo-dependencies t)
(setq org-use-fast-todo-selection t)
(setq org-src-fontify-natively t)
(setq org-todo-keyword-faces '(("TODO" . "red")
                               ("DOING" . "#836FFF")
                               ("ABORT" . "#FFA500")
                               ("WAITING" . "#FFFF00")
                               ("DONE" . "green")))
(setq org-tag-alist '((:startgroup . nil)
                      ("@work" . ?w) ("@home" . ?h) ("@boyaa" . ?b)
                      (:endgroup . nil)
                      ("project" . ?1) ("bug" . ?2) ("optimize" . ?3) ("other" . ?4)))

(setq org-log-done 'time)
(setq org-startup-with-inline-images t)
(setq org-directory "/home/josephzeng/org/")
;;Default capture files.
(setq org-default-notes-file (concat org-directory "tasks.org"))
;;Capture template
(setq org-capture-templates '(
			      ("t" "Tasks" entry (file+headline "tasks.org" "Tasks") "* TODO %^{TaskName}\n%u\n%a\n")
			      ("j" "Journal" entry (file+headline "journal.org" "Journal")  "* %^{heading} %t %^g\n  %?\n")
			      ("n" "Notes" item (file+headline "notes.org" "Notes")  "* %^{heading} %t %^g\n  %?\n")
				  ("c" "Calendar" item (file+headline "calendar.org" "Calendar")  "* %^{heading} %t %^g\n  %?\n")
			      ("i" "Inbox" plain (file+headline "inbox.org" "Inbox")  "* %^{heading} %t %^g\n  %?\n")
				  )
)
(setq org-archive-location (concat org-directory "tasks/" (format-time-string "%Y%m") "_%s::datetree/* Archive from %s"))
(setq org-archive-save-context-info '(time file ltags itags todo category olpath))
(setq org-export-with-sub-superscripts nil)
(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c o i") 'org-insert-structure-template)

(require 'org-tempo)

(use-package ob-go
    :pin melpa
    :ensure t
)
(org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (css . t)
     (js . t)
     (org . t)
     (python . t)
     (sed . t)
     (sql . t)
     (R . t)
     (go . t)
     ;(c . t)
     ;(sh . t)
     ;(c++ . t)
     (perl . t)
     (latex . t)
     (java . t)
     (haskell . t)
     (eshell . t)
     (lua . t)
     (lisp . t)
     (plantuml . t)
     (ditaa . t)
    )
)

(use-package toc-org
    :pin melpa
    :ensure t
    :init
    (add-hook 'org-mode-hook 'toc-org-mode)
)
(use-package org-bullets
	:pin melpa
	:ensure t
	:init
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
)

(require 'valign)
(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)
(add-hook 'valign-mode-hook (lambda () (unless valign-mode
                                               (valign-remove-advice))))

(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "/home/josephzeng/org/"
         :publishing-directory "/home/josephzeng/publish/"
         :html-extension "html"
         :base-extension "org"
         :with-tags "@work"
         ;;;:makeindex t
         :recursive t
         :publishing-function (org-html-publish-to-html)
         :auto-sitemap t
         :headline-levels 5
         :auto-preamble t
         :section-numbers nil
         ;;;:auto-index nil
         ;;;:index-filename "index.org"
         ;;;:index-title "index"
         ;;;:link-home "index.html"
         ;;;:section-numbers nil
         ;;;:html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/base.css\" \/>"
         ;;;:style-include-default nil
		 :sitemap-filename "sitemap.org"
		 :sitemap-title "sitemap"
		 :table-of-contents nil
         )
        ("org-static"
         :base-directory "/home/josephzeng/org/"
         :publishing-directory "/home/josephzeng/publish/static/"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment
         )      
        ("org" 
         :components ("org-notes" "org-static")
         :author "JosephZeng"
         ))
)
(defun orgtasks() (interactive) (find-file "/home/josephzeng/org/tasks.org"))
(global-set-key "\C-cz" 'orgtasks)
(define-key global-map "\C-ca" 'org-agenda-list)
(define-key global-map "\C-ct" 'org-todo-list)
(define-key global-map "\C-cm" 'org-tags-view)
(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%Y-%m-%d %a>" . "<%Y-%m-%d %a %W %H:%M>"))
(setq org-export-with-toc t)
(setq-default org-use-sub-superscripts nil)
(setq org-html-doctype "html5")
(setq org-html-xml-declaration nil)
(setq org-html-validation-link nil)
(setq org-publish-use-timestamps-flag t)
(setq org-html-postamble t
	          org-html-postamble-format
			          '(("en" "<p class=\"postamble\">First created: %d <br />Last updated: %C <br />Power by %c</p>")))


(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-delete-old-versions t)
)

(use-package quickrun
  :ensure t
  :defer 1
  :custom (quickrun-focus-p nil)
  :bind (("C-c x" . quickrun))
)
(quickrun-add-command "c++/c1z"
  '((:command . "g++")
    (:exec    . ("%c -std=c++1z %o -o %e %s"
		 "%e %a"))
    (:remove  . ("%e")))
  :default "c++")
(quickrun-add-command "php"
	'((:command . "php")
	(:exec    . "%c -l %s"))
	:mode 'php-model)
(quickrun-add-command "c/gcc"
  '((:exec . ("%c -std=c++14 %o -o %e %s"
	      "%e %a")))
  :override t)

(use-package rmsbolt
  :ensure t
  :defer 1
  :custom
  (rmsbolt-asm-format nil)
  (rmsbolt-default-directory "/tmp"))


(use-package hl-todo
  :ensure t
  :bind (:map hl-todo-mode-map
         ("C-c t p" . hl-todo-previous)
         ("C-c t n" . hl-todo-next)
         ("C-c t o" . hl-todo-occur))
  :hook (prog-mode . hl-todo-mode)
  :config
  (dolist (keyword '("BUG" "ISSUE" "FIXME" "XXX" "NOTE" "NB"))
    (cl-pushnew `(,keyword . ,(face-foreground 'error)) hl-todo-keyword-faces))
  (dolist (keyword '("WORKAROUND" "HACK" "TRICK"))
    (cl-pushnew `(,keyword . ,(face-foreground 'warning)) hl-todo-keyword-faces)))

(use-package whitespace
  :ensure nil
  :hook ((prog-mode markdown-mode conf-mode) . whitespace-mode)
  :custom
  (whitespace-style '(face trailing)))

(use-package ediff
  :ensure nil
  :hook (ediff-quit . winner-undo) ;; restore windows layout
  :custom
  (ediff-diff-options "-w") ;; turn off whitespace checking
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-merge-split-window-function 'split-window-horizontally))

(use-package gdb-mi
  :ensure nil
  :hook (gud-mode . gud-tooltip-mode)
  :custom
  (gdb-show-main t)
  (gdb-display-io-nopopup t)
  (gdb-show-changed-values t)
  (gdb-delete-out-of-scope t)
  (gdb-use-colon-colon-notation t)
  (gdb-restore-window-configuration-after-quit t)
  :config
  ;; Add color to the current GUD line
  ;; From https://kousik.blogspot.com/2005/10/highlight-current-line-in-gdbemacs.html
  (defconst gud-highlight-face 'secondary-selection)

  (defvar gud-overlay
    (let ((overlay (make-overlay (point) (point))))
      (overlay-put overlay 'face gud-highlight-face)
      overlay)
    "Overlay variable for GUD highlighting.")

  (define-advice gud-display-line (:after (true-file _line))
    "Highlight gud current line."
    (when-let* ((buffer (gud-find-file true-file)))
      (with-current-buffer buffer
        (move-overlay gud-overlay (line-beginning-position) (line-end-position)
                      (current-buffer)))))

  (define-advice gud-kill-buffer-hook (:after nil)
    "Remove highlight overlay."
    (delete-overlay gud-overlay))

  (define-advice gud-sentinel (:after (_1 _2))
    "Remove highlight overlay when user quit gud."
    (delete-overlay gud-overlay)))

(use-package compile
  :ensure nil
  :custom
  (compilation-always-kill t)
  (compilation-scroll-output t)
  (compilation-ask-about-save nil) ;; save all buffers on `compile'
  :hook (compilation-filter . my/colorize-compilation-buffer)
  :config
  (add-to-list 'compilation-finish-functions 'my/notify-compilation-result)
  :preface
  (defun my/colorize-compilation-buffer ()
    "ANSI coloring in compilation buffers."
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (defun my/notify-compilation-result (_comp-buffer exit-string)
    "Notify after the compilation is done."
    (if (string-match "^finished" exit-string)
        (notifications-notify :title "Compilation"
                              :body "Compilation successful :-)"
                              :timeout 5000
                              :urgency 'normal)
      (notifications-notify :title "Compilation"
                            :body "Compilation failed :-("
                            :timeout 5000
                            :urgency 'critical)))
  )


(use-package evil-nerd-commenter
  :ensure t
  :bind ("M-;" . evilnc-comment-or-uncomment-lines))

(use-package evil-surround
  :ensure t
  :hook (after-init . global-evil-surround-mode))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

(use-package dired
  :ensure nil
  :custom
  (dired-dwim-target t)
  (dired-bind-man nil)
  (dired-bind-info nil)
  (dired-auto-revert-buffer t)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-listing-switches "-Afhlv")
  :bind (:map dired-mode-map
         ("-" . dired-up-directory)
         ("C-c +" . dired-create-empty-file)
         ("C-c C-e" . wdired-change-to-wdired-mode)))

(use-package dired-x
  :ensure nil
  :hook (dired-mode . dired-omit-mode)
  :custom
  (dired-omit-verbose nil)
  (dired-omit-files (rx (or ".git" ".svn"
                            ".cache"
                            ".vscode"
                            ".ccls-cache" ".clangd"
                            ".elc" ".pyc" ".o" ".swp")))
  (dired-clean-confirm-killing-deleted-buffers nil))

(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

(use-package dsvn
  :ensure t
)


(use-package eshell
  :defer t
  :bind ([f1] . eshell-as)
  :init
  (setf eshell-directory-name (locate-user-emacs-file "local/eshell"))
  :config
  (add-hook 'eshell-mode-hook ; Bad, eshell, bad!
            (lambda ()
              (define-key eshell-mode-map (kbd "<f1>") #'quit-window))))

(use-package expand-region
  :ensure t
  :bind ("C-c =" . er/expand-region))

(provide 'plugins)
