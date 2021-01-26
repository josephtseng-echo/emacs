;;; base.el --- 
;; 
;; Filename: base.el
;; Author: josephzeng <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:25:27 (HKT)


(global-hl-line-mode 1)
(set-face-background 'highlight "#222")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)

(toggle-frame-fullscreen)

(setq tab-width 4
      inhibit-splash-screen t
      initial-scratch-message nil
      sentence-end-double-space nil
      indent-tabs-mode nil
      make-backup-files nil
      auto-save-default nil)
(setq create-lockfiles nil)

(savehist-mode 1)
(setq savehist-file "~/.emacs.d/.history_bak")
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))


(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(let ((display-table (or standard-display-table (make-display-table))))
  (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
  (setq standard-display-table display-table))
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "grey")

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

(setq ring-bell-function 'ignore)

;;隐藏滚动栏和菜单
(tool-bar-mode 0)
(menu-bar-mode 0)
;(scroll-bar-mode 0)
;(set-scroll-bar-mode nil)

;;取消工具栏
(tool-bar-mode nil)

;;关闭提示声
(setq visible-bell t)

;;关闭启动时的画面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;;y/n for yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; start week on Monday
(setq calendar-week-start-day 1)

;;显示行列号
(setq column-number-mode t)
(setq line-number-mode t)

;;鼠标点击插入剪贴板内容
(setq mouse-yank-at-point t)

;;粘贴缓冲数量
(setq kill-ring-max 200)

;;TAB设置
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())

;;防止页面滚动时跳动
(setq scroll-margin 3 scroll-conservatively 10000)

;;设置默认mode text
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;括号匹配模式
(show-paren-mode t)
 
;;括号匹配高亮
(setq show-paren-style 'parenthesis)
 
;;鼠标指针自动移开
(mouse-avoidance-mode 'animate)

;;标题栏显示buffer名字
(setq frame-title-format "emacs@%b")
 
;;语法高亮
(setq global-font-lock-mode t)
 
;;C-k 同时删除
(setq-default kill-whole-line t)

;;自动保存
(setq auto-save-mode nil)

;;不生成临时文件
(setq-default make-backup-files nil)

;;允许外部粘贴
(setq x-select-enable-clipboard t)


;;文件末增加一新行
(setq require-final-newline t)
 
;;Non-nil if Transient-Mark mode is enabled
(setq-default transient-mark-mode t)

;;上下移动光标保持在行尾
(setq track-eol t)

(provide 'base)
