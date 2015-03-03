;; org
(require 'org-install)
(require 'ox-html)
;;(require 'ox-rss)
(require 'ox-publish)

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
;; (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-ci" 'org-iswitchb)
(setq org-agenda-files (list "/cygdrive/e/gtd/org/"
))

;; 定义快捷插入操作
          
(setq org-todo-keywords
    '((sequence "TODO(t!)" "NEXT(n!)" "WAITTING(w!)" "SOMEDAY(s!)" "|" "DONE(d!)" "ABORT(a@/!)" "CANCELED(C@/!)" "|" "REPORT(r)" "BUG(b)" "|" "FIXED(f)")))
    
(setq org-tag-alist '(
	("@work" . ?w)
	("@life" . ?r)
	("@diary" . ?n)
	("@notes" . ?d)
	("@study" . ?s)
    ("@bolg" . ?b)
	("@kugou" . ?k)
	("@josephzeng" . ?j)
))

(setq org-publish-project-alist
      '(
	("org-notes"
         :base-directory "/cygdrive/e/gtd/org"
         :publishing-directory "/cygdrive/e/gtd/publish"
	 :html-extension "html"
         :base-extension "org"
	 :makeindex t
         :recursive t
         :publishing-function (org-html-publish-to-html)
	 :auto-sitemap t
	 :headline-levels 4
	 :auto-preamble t
	 :section-numbers nil
	 :headline-levels 3
         :auto-index nil
	 	 ;;; :sitemap-filename "index.org"
         ;;; :sitemap-title "index"
         ;;; :sitemap-sort-files anti-chronologically
         ;;; :sitemap-style list
         index-filename "index.org"
         ndex-title "index"
         link-home "index.html"
         :section-numbers nil
	 ;;;:with-toc nil
         ;;;:with-latex t
         ;;;:html-head-include-default-style nil
         ;;;:html-head-include-scripts nil
         :html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/base.css\" \/>"
	 :style-include-default nil
	 )
	;;;("blog-rss"
        ;;; :base-directory "/cygdrive/e/gtd/org"
        ;;; :base-extension "org"
        ;;; :publishing-directory "/cygdrive/e/gtd/publish"
        ;;; :publishing-function (org-rss-publish-to-rss)
        ;;; :html-link-home "http://www.zshuiquan.com/"
        ;;; :html-link-use-abs-url t
        ;;; :exclude ".*"
        ;;; :include ("rss.org")
        ;;; :with-toc nil
        ;;; :section-numbers nil
        ;;; :title "index rss")
        ("org-static"
         :base-directory "/cygdrive/e/gtd/org"
         :publishing-directory "/cygdrive/e/gtd/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment
	 )      
	("org" 
         :components ("org-notes" "org-static")
         :author "josephzeng36@gmail.com"
         )))

(setq org-export-with-toc t)
(setq-default org-use-sub-superscripts nil)

(defun org-summary-todo (n-done n-not-done)
	"Swith entry to DONE when all subentries are done, to TODO otherwise."
        (let (org-log-done org-log-states)   ; turn off logging.
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(provide 'init-org)
