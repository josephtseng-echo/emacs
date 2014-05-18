;;;;;;;;;;;;;;;;;;;;org mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/org/lisp")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/org/contrib/lisp" t)
(require 'org-install)
(require 'org-publish)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
;; (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-ci" 'org-iswitchb)
(setq org-agenda-files (list "/cygdrive/e/2014/gtd/org/"
))

;; 定义快捷插入操作
(define-skeleton iexp
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
  ""
  "#+BEGIN_EXAMPLE\n"
  _ "\n"
  "#+END_EXAMPLE"
  )
;;(define-abbrev org-mode-abbrev-table "iexp" "" 'iexp)

          
(setq org-todo-keywords
    '((sequence "TODO(t!)" "NEXT(n!)" "WAITTING(w!)" "SOMEDAY(s!)" "|" "DONE(d!)" "ABORT(a@/!)")))
    
(setq org-tag-alist '(
	("@work" . ?w)
	("@life" . ?r)
	("@diary" . ?n)
	("@notes" . ?d)
	("@study" . ?s)
	("@kugou" . ?k)
	("@xiaozeng" . ?x)
))

(setq org-publish-project-alist
      '(("org"
         :base-directory "/cygdrive/e/2014/gtd/org"
         :publishing-directory "/cygdrive/e/2014/gtd/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\" \/>")
        ("note-static"
         :base-directory "/cygdrive/e/2014/gtd/org"
         :publishing-directory "/cygdrive/e/2014/gtd/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "josephzeng36@gmail.com"
         )))
(provide 'init-org)