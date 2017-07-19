;;; files
;; backups
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 4
      kept-old-versions 2
      version-control t
      backup-directory-alist `(("." . ,(f-expand
                                        "backups" user-emacs-directory))))
;; 100 MB
(setq large-file-warning-threshold (* 100 1000 1000))

;; recent files
(setq recentf-max-saved-items 256
      recentf-max-menu-items 16)
(recentf-mode)

;; set auto revert of buffers if file is changed externally
(global-auto-revert-mode)

;; symlink version-control follow
(setq vc-follow-symlinks t)

;; dired
(setq dired-dwim-target t ; enable side-by-side dired buffer targets
      dired-recursive-copies 'always ; better recursion in dired
      dired-recursive-deletes 'top
      dired-listing-switches "-lahp")

;; compilation
(setq compilation-ask-about-save nil
      compilation-always-kill t)

;; more context when scrolling
(setq next-screen-context-lines 4)

;; y/n for yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; start week on Monday
(setq calendar-week-start-day 1)

;; window undo/redo
(winner-mode)

;; tabs are truly evil
(setq-default indent-tabs-mode nil)

;; sentences end with one space
(setq sentence-end-double-space nil)

;;; settings
;; enable all commands
(setq disabled-command-function nil)

;; default truncate lines
(setq-default truncate-lines t)

;; disable bell
(setq ring-bell-function 'ignore
      visible-bell t)

;; increase garbage collection threshold
(setq gc-cons-threshold (* 10 1024 1024))

;; inhibit startup message
(setq inhibit-startup-message t)

;; kill settings
(setq save-interprogram-paste-before-kill t
      kill-do-not-save-duplicates t
      kill-whole-line t)

;; repeat mark pop
(setq-default set-mark-command-repeat-pop t)

;; set terminfo
(setq system-uses-terminfo nil)


;; C styles
(c-add-style "work"
             '("bsd"
               (c-basic-offset . 4)
               (c-offsets-alist . ((arglist-intro . +)))))

(add-to-list 'c-default-style '(c-mode . "work"))
(add-to-list 'c-default-style '(c++-mode . "work"))

(setq ring-bell-function 'ignore)
(set-cursor-color "white")
(set-mouse-color "white")
(global-font-lock-mode t)
(transient-mark-mode t) 

(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)
(setq select-active-regions t)

(setq default-fill-column 200)

(mouse-avoidance-mode 'animate)

(blink-cursor-mode -1)
(transient-mark-mode 1)

(if (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))

(menu-bar-mode 0)

(scroll-bar-mode nil)

(setq column-number-mode t)
(setq line-number-mode t)

(setq visible-bell t)

;;front setting
;;(set-default-font "Courier New Regular 11")
(add-to-list 'default-frame-alist
                          '(font . "DejaVu Sans Mono-12"))

;;
(set 'some-variable t)
(setq track-eol t)

(setq-default line-spacing 2)

(setq mouse-yank-at-point t)

(setq-default auto-fill-function 'do-auto-fill)

(setq-default make-backup-files nil)

(setq default-fill-column 200)

(setq kill-ring-max 200)

;;time setting start
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
;;time setting end

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq current-language-environment "utf-8")
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)

(setq inhibit-startup-message t)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq ansi-color-for-comint-mode t)

(setq frame-title-format
      (list "[" '(:eval (projectile-project-name)) "]" 
	    ""
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;;
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#605555")
;(set-face-background 'hl-line "#7EEE14")

(require 'time-stamp)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format 
                          "由 %:u修改 时间：%04y-%02m-%02d %02H:%02M:%02S"
                          time-stamp-active t
                          time-stamp-warn-inactive t)

(setq show-buffer-file-name nil)

(provide 'base)
