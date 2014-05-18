;;
(defvar mswin  (equal window-system 'w32)  "Non-nil means windows system.")
(defvar cygwin (equal system-type 'cygwin) "Non-nil means cygwin system.")

(defvar use-cua nil "Use CUA mode or not.")

(defvar last-region-beg     nil "Beginning of last region.")
(defvar last-region-end     nil "End of last region.")
(defvar last-region-is-rect nil "Last region is rectangle or not.")
(defvar last-region-use-cua nil "Last region use CUA mode or not.")

;;
(setq ring-bell-function 'ignore)

;; 指针颜色设置为白色
(set-cursor-color "white")
;; 鼠标颜色设置为白色
(set-mouse-color "white")

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示括号匹配 
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  

(transient-mark-mode t) 

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)
(setq select-active-regions t)


;; 在标题栏提示你目前在什么位置
(setq frame-title-format "josephzeng@%b")
;;;设置标题栏显示文件的完整路径名  
(setq frame-title-format  
      (list (format "%s %%S: %%j " (system-name))  
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; 默认显示 80列就换行 
(setq default-fill-column 80)

;;让鼠标指针自动让开
(mouse-avoidance-mode 'animate)

;;指针不闪
(blink-cursor-mode -1)
(transient-mark-mode 1)

;; 去掉工具栏
(if (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))

;;去掉菜单栏
(menu-bar-mode 0)
;;(menu-bar-mode nil)

;; 去掉滚动栏
(scroll-bar-mode nil)

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)

;; bell给关掉
(setq visible-bell t)

;;front setting
(set-default-font "12")

;;
(setq some-variable t)
(set 'some-variable t)

;;禁用启动信息
(setq inhibit-startup-message t)

;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;不要生成临时文件
;;(setq-default make-backup-files nil)

;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t)

;;显示80列就换行
(setq default-fill-column 80)

;;在标题栏提示当前位置
(setq frame-title-format "josephzeng@%b")

;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;;设置tab为4个空格的宽度
(setq default-tab-width 4)

;;
(setq make-backup-files t)
(setq vc-make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 6)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.backups/emacs")))
(setq backup-by-copying t)

;;time setting start
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;time setting end

;; For my language code setting (UTF-8)
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

;; 设置缩进
(setq default-tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq indent-line-function 'insert-tab)
(add-hook 'html-mode-hook
'(lambda()
(setq tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)))
(add-hook 'js-mode-hook
'(lambda()
(setq tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)))

;; 关闭启动画面
(setq inhibit-startup-message t)

;;设置 sentence-end 可以识别中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 解决emacs shell显示问题
(setq ansi-color-for-comint-mode t)

;;设置大的kill ring
(setq kill-ring-max 1024)
(setq max-lisp-eval-depth 40000)        ;lisp最大执行深度
(setq max-specpdl-size 10000)           ;最大容量
(setq undo-outer-limit 5000000)         ;撤销限制
(setq message-log-max t)                ;设置message记录全部消息, 而不用截去
(setq eval-expression-print-length nil) ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)  ;设置执行表达式的深度没有限制
(setq global-mark-ring-max 1024)        ;设置最大的全局标记容量
(setq history-delete-duplicates t)      ;删除minibuffer的重复历史

(require 'time-stamp)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format 
                          "由 %:u修改 时间：%04y-%02m-%02d %02H:%02M:%02S"
                          time-stamp-active t
                          time-stamp-warn-inactive t)


(provide 'init-base)