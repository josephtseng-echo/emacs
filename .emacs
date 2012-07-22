; make sure the target directory is on your load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;设置默认工作目录
(setq default-directory "/cygdrive/f/work/test2")

;;;; 显示时间    
(setq display-time-24hr-format t)    
(setq display-time-day-and-date t)
(display-time)
(setq display-time-interval 10)
;;;; 关闭启动画面    
(setq inhibit-startup-message t)    
;;;;设置大的kill ring    
(setq kill-ring-max 150)
(menu-bar-mode 0) 
(tool-bar-mode nil);去掉那个大大的工具栏    
(scroll-bar-mode nil);去掉滚动条，因为可以使用鼠标滚轮了 ^_^    
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴    
(font-lock-mode t) ; 开启语法高亮
(auto-image-file-mode)
(mouse-avoidance-mode 'animate)
(global-font-lock-mode t)
(setq user-full-name "josephzeng")
(setq user-mail-address "josephzeng36@gmail.com")

;;让鼠标指针自动让开
(mouse-avoidance-mode 'animate)
;;指针不闪
(blink-cursor-mode -1)
(transient-mark-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq default-tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
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

(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)  
(setq default-keyboard-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)  
(set-default-coding-systems 'utf-8-unix) 
(set-selection-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix) 
(modify-coding-system-alist 'process "*" 'utf-8-unix)  
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))  
(setq-default pathname-coding-system 'utf-8-unix)  
(set-file-name-coding-system 'utf-8-unix)
(setq ansi-color-for-comint-mode t);;处理shell-mode乱码,好像没作用
(global-set-key (kbd "C-SPC") 'nil)  
(global-set-key (kbd "s-<SPC>") 'set-mark-command)
(setq confirm-kill-emacs 'y-or-n-p)

;;备份位置
(setq backup-directory-alist (quote (("." . "~/.backups"))))


;; 用一个很大的kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 1024)
(setq max-lisp-eval-depth 40000)        ;lisp最大执行深度
(setq max-specpdl-size 10000)           ;最大容量
(setq undo-outer-limit 5000000)         ;撤销限制
(setq message-log-max t)                ;设置message记录全部消息, 而不用截去
(setq eval-expression-print-length nil) ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)  ;设置执行表达式的深度没有限制
(setq global-mark-ring-max 1024)        ;设置最大的全局标记容量
(setq history-delete-duplicates t)      ;删除minibuffer的重复历史

(setq ecb-history-make-buckets 'never)

(require 'php-mode)
(add-hook 'php-mode-user-hook 'turn-on-font-lock)
;;根据扩展名绑定
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\|\\.tpl\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-hook 'php-mode-hook
'(lambda()
(setq tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
(require 'auto-complete-etags)
(add-to-list 'ac-sources 'ac-source-etags)
(setq ac-etags-use-document t)

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-start nil)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-yasnippet    
                 ac-source-semantic  
                 ac-source-ropemacs  
                 ac-source-imenu    
                 ac-source-words-in-buffer  
                 ac-source-dictionary  
                 ac-source-abbrev    
                 ac-source-words-in-buffer    
                 ac-source-files-in-current-dir    
                 ac-source-filename))
(define-key ac-completing-map [return] 'nil);
(setq ac-auto-show-menu 0.8)
(setq ac-menu-height 20)
(set-face-background 'ac-candidate-face "lightgray")  
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
(setq ac-dwim t)
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
(setq ac-fuzzy-enable t)
(setq ac-candidate-max ac-candidate-menu-height)
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-j") 'auto-complete)
(define-key ac-completing-map "\ESC/" 'ac-stop)


(add-to-list 'load-path "~/.emacs.d/site-lisp/mmm-mode")
(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)


;;(load-file "~/.emacs.d/site-lisp/yasnippet.el")
;; not yasnippet-bundle
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")
(yas/global-mode 1)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
    yas/ido-prompt
    yas/completing-prompt))

;;Load cedet
(load-file "~/.emacs.d/site-lisp/cedet/common/cedet.el")
(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)
(global-ede-mode 1)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)

(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb")
(require 'ecb)

(defvar ecb-mode nil)
;; use to start ecb in my way
(defun ecb-start()
  (interactive)
  (if (not ecb-mode)
      (progn
        ;; just a trick for starting ecb 2.40 basing on inner cedet
        (if (and use-inner-cedet t)
            (progn
              (require 'semantic/analyze)
              (provide 'semantic-analyze)
              (provide 'semantic-ctxt)
              (provide 'semanticdb)
              (provide 'semanticdb-find)
              (provide 'semanticdb-mode)
              (provide 'semantic-load)))

        (add-to-list 'load-path (concat plugins-dir-prefix "ecb/"))
        ;; It is not available to use ecb- options after starting emacs, 
        ;; to do what, use (require 'ecb) instead
        (require 'ecb-autoloads)
        ;; do not show tip of the day
        (setq ecb-tip-of-the-day nil)
        ;; layout: left5
        (setq ecb-layout-name "left5")
        ;; use keystroke to activate and deactivate ecb
        (global-set-key [?\C-c ?' ?c] 'ecb-activaion-switch)
        (setq ecb-mode t)
)))

(defvar ecb-switch nil)
(defun ecb-activaion-switch()
  (interactive)
  (if ecb-switch
      (progn
        (ecb-deactivate)
        (setq ecb-switch nil))
    (progn
      (ecb-activate)
      (setq ecb-switch t))))

(setq ecb-tip-of-the-day nil)           ;启动ECB时不显示每日提示
; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

; 隐藏和显示ECB窗口
(define-key global-map [(control f7)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f8)] 'ecb-show-ecb-windows)

; 使某一ecb窗口最大化
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)

; 恢复原始窗口布局
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

(custom-set-variables 
	'(ecb-fix-window-size t)
	'(ecb-layout-window-sizes nil)
	'(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
	'(ecb-windows-width 0.25))

;;(ecb-layout-define "my-cscope-layout" left nil
;;                   (ecb-set-methods-buffer)
;;                   (ecb-split-ver 0.5 t)
;;                   (other-window 1)
;;                   (ecb-set-history-buffer)
;;                   (ecb-split-ver 0.25 t)
;;                   (other-window 1)
;;                   (ecb-set-cscope-buffer))

;;(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
;;                         (switch-to-buffer "*cscope*"))

;;(setq ecb-layout-name "my-cscope-layout")

;; Disable buckets so that history buffer can display more entries
;;(setq ecb-history-make-buckets 'never)

(setq stack-trace-on-error t)


(require 'anything)
(require 'anything-match-plugin)
(require 'anything-config)
(setq anything-sources
      (list anything-c-source-buffers
            anything-c-source-file-name-history
            anything-c-source-info-pages
            anything-c-source-man-pages
	    anything-c-source-file-cache
            anything-c-source-emacs-commands))
(global-set-key (kbd "M-X") 'anything)

;;emacs的重做命令模拟
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)

;;显示行号
(require 'linum+)
(global-linum-mode 1);;启用全局显示行号模式
(global-set-key (kbd "C-x N") 'linum-mode)

;;智能括号
(require 'autopair)      ;;智能自动补全括号
(autopair-global-mode 1) ;; 全局启用智能补全括号
(require 'highlight-parentheses)        ;智能括号匹配高亮 

;;高亮显示设置
(require 'generic-x);;更加丰富的高亮
(require 'hl-line+)
;;高亮显示关键字
(require 'highlight-fixmes-mode)
(highlight-fixmes-mode);;启用关键字高亮功能
(global-set-key (kbd "C-c / M-f") 'highlight-fixmes-mode)
;; 高亮显示当前buffer中的一个符号 Quickly highlight a symbol throughout the buffer and cycle through its locations.
(require 'highlight-symbol)
(global-set-key (kbd "C-c / M-h a") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c / M-h n") 'highlight-symbol-next)
(global-set-key (kbd "C-c / M-h p") 'highlight-symbol-prev)

(add-to-list 'load-path "~/.emacs.d/site-lisp/company")
(autoload 'company-mode "company" nil t)

;;;使autopair模式和highlight-parentheses集成交互使用
(add-hook 'highlight-parentheses-mode-hook
 '(lambda ()
    (setq autopair-handle-action-fns
  (append
   (if autopair-handle-action-fns
autopair-handle-action-fns
     '(autopair-default-handle-action))
   '((lambda (action pair pos-before)
(hl-paren-color-update)))))))

;;Enables highlight-parentheses-mode on all buffers:
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq show-paren-style 'parentheses)    ;括号匹配显示但不是烦人的跳到另一个括号。

(require 'doxymacs)

(require 'xcscope)

(require 'ibuffer)

;;(global-auto-revert-mode);;M-x revert-buffer

(global-set-key [f2] 'undo)
(global-set-key [f3] 'ibuffer)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'replace-regexp) ;;支持正则表达式
(global-set-key [f6] 'replace-string)
(global-set-key [f7] 'gdb)
(global-set-key [f8] 'save-buffer);
(global-set-key [f9] 'shell) ;;定义F9为CMD命令模式
(global-set-key [f10] 'semantic-ia-fast-jump)
(global-set-key [f12] 'ecb-activate) ;;定义F12键为激活ecb
(global-set-key [C-f12] 'ecb-deactivate) ;;定义Ctrl+F12为停止ecb
(global-set-key [f11] 'delete-other-windows) ;;设置F11为删除其它窗口

;;Ctrl-s Ctrl-w;;搜索光标下字符串
;;M-x prefer-coding-system ;;定优先用 utf-8 来解码
;; M-x revert-buffer-with-coding-system 来用指定编码重新读入文件

;;(require 'pymacs)
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)

;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;(require 'pycomplete)


;;;Zen Coding
;'zencoding-expand-line bound to C-Return
;(require 'zencoding-mode)
;(add-hook 'sgml-mode-hook 'zencoding-mode) ;;Auto-start on any markup modes
;(add-hook 'html-mode-hook 'zencoding-mode)
;(add-hook 'php-mode-hook 'zencoding-mode)

(setq frame-title-format "%n%F/%b")

(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))
;;hippie的自动补齐策略，优先调用了senator的分析结果：
(autoload 'senator-try-expand-semantic "senator")


;;CC-mode配置
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
:;(setq indent-tabs-mode nil)
(setq c-basic-offset 4 )
(setq default-tab-width 4)
;;(setq tab-stop-list())
;;(loop for x downfrom 40 to 1 do
   ;; (setq tab-stop-list (cons(* x 4) tab-stop-list)))
;;默认Linux内核编程风格，取自Linux内核说明文档
(setq auto-mode-alist (cons '("/usr/src/linux.*/.*\\.[ch]$" . linux-c-mode)
   auto-mode-alist))
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
   (interactive)
   (c-mode)
   (c-set-style "K&R")
   (setq tab-width 4) ;;默认风格是8个缩进
   (setq indent-tabs-mode t)
   (setq c-basic-offset 4))  ;;默认风格是8个缩进
;;c-mode或cc-mode下缩进只有4格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "Stroustrup")))

;; 代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;能把一个代码块缩起来，需要的时候再展开
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show

;;tabbar
(require 'tabbar)
(tabbar-mode t)
(define-prefix-command 'lwindow-map)
(global-set-key (kbd "<C-up>") 'tabbar-backward-group)
(global-set-key (kbd "<C-down>") 'tabbar-forward-group)
(global-set-key (kbd "<C-left>") 'tabbar-backward)
(global-set-key (kbd "<C-right>") 'tabbar-forward)
;; 设置默认主题: 字体, 背景和前景颜色，大小  
(set-face-attribute 'tabbar-default-face nil  
                    :family "DejaVu Sans Mono"  
                    :background "gray80"  
                    :foreground "gray30"  
                    :height 1.0  
                    )  
;; 设置左边按钮外观：外框框边大小和颜色  
(set-face-attribute 'tabbar-button-face nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70")  
                    )  
;; 设置当前tab外观：颜色，字体，外框大小和颜色  
(set-face-attribute 'tabbar-selected-face nil  
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
                    :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold  
                    )  
;; 设置非当前tab外观：外框大小和颜色  
(set-face-attribute 'tabbar-unselected-face nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 2 :color "#00B2BF")  
                    )

;;session
;;(require 'session)
;;(add-hook 'after-init-hook
;;'session-initialize)

;;打开缺省禁用的功能
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;设置备份时的版本控制，这样更加安全。
(mapcar
  (function (lambda (setting)
                     (setq auto-mode-alist
                               (cons setting auto-mode-alist))))
   '(("\\.xml$".  sgml-mode)
     ("\\\.bash" . sh-mode)
     ("\\.rdf$".  sgml-mode)
     ("\\.session" . emacs-lisp-mode)
     ("\\.l$" . c-mode)
     ("\\.css$" . css-mode)
     ("\\.cfm$" . html-mode)
     ("gnus" . emacs-lisp-mode)
     ("\\.idl$" . idl-mode)))

;;一个简单的办法设置 auto-mode-alist, 免得写很多 add-to-list.
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; 设置 hippie-expand 很好用的功能。 M-x hippie-expand
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;;临时记号
;;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以 使用 bookmark或者寄存器。
;;但是这些实在是太慢了。你多想拥有vi那样的 ma, mb, 'a, 'b 的操作。现在你可以用几行 elisp 达到类似的目的
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;;我一直觉得 Emacs 没有这样一个方便的命令，但是 Oliver 给了 我一个完美的答案：
;;有了这段代码之后，当你按 C-c a x (x 是任意一个字符) 时，光 标就会到下一个 x 处。再次按 x，光标就到下一个 x。比如 C-c a w w w w ..., C-c a b b b b b b ...
;;我觉得这个方式比 vi 的 "f" 要快。
;;(defun wy-go-to-char (n char)
;;  "Move forward to Nth occurence of CHAR.
;;Typing `wy-go-to-char-key' again will move forwad to the next Nth
;;occurence of CHAR."
;;  (interactive "p\ncGo to char: ")
;;  (search-forward (string char) nil nil n)
;;  (while (char-equal (read-char)
;;             char)
;;    (search-forward (string char) nil nil n))
;;  (setq unread-command-events (list last-input-event)))
;;(define-key global-map (kbd "C-c a") 'wy-go-to-char)

;;CC-mode配置
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
:;(setq indent-tabs-mode nil)
(setq c-basic-offset 4 )
(setq default-tab-width 4)
;;(setq tab-stop-list())
;;(loop for x downfrom 40 to 1 do
   ;; (setq tab-stop-list (cons(* x 4) tab-stop-list)))
;;默认Linux内核编程风格，取自Linux内核说明文档
(setq auto-mode-alist (cons '("/usr/src/linux.*/.*\\.[ch]$" . linux-c-mode)
   auto-mode-alist))
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
   (interactive)
   (c-mode)
   (c-set-style "K&R")
   (setq tab-width 4) ;;默认风格是8个缩进
   (setq indent-tabs-mode t)
   (setq c-basic-offset 4))  ;;默认风格是8个缩进
;;c-mode或cc-mode下缩进只有4格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "Stroustrup")))

;;======================            自动补全功能        =====================
;;自动补全功能，这事从王垠的网站直接Copy过来的，引用一些他对此的说明
;;设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面
;;的函数来补全这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如
;;还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表
;;里，到list，当前使用的匹配方式会在 echo 区域显示。
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相
;;同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后
;;多按几下 M-/ 就能得到那一行。
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))
;;hippie的自动补齐策略，优先调用了senator的分析结果：
(autoload 'senator-try-expand-semantic "senator")

;; 设置每次保存时要更新的项目
(setq header-update-on-save
    '(  filename
        modified
        counter
        copyright))
;; 设置文件头的显示格式
(setq header-field-list
'(  filename  ;文件名
    blank    ;空行，下同
    ;;copyright ;;版权
    version
    author  ;作者
    created   ;创建人
    blank
    description   ;描述
    ;;blank
    ;;modified_by ;更改者
   ;; blank
    ;;status  ;状态，是否发布
    ;;更新
    ;;blank
  ))

;; Htmlize
(setq load-path (append (list (expand-file-name "~/.emacs.d/site-lisp/htmlize")) load-path))
(require 'htmlize)
(setq htmlize-html-charset "utf-8")
(autoload 'htmlize-buffer "htmlize" "" t)

;;muse
(add-to-list 'load-path "~/.emacs.d/site-lisp/muse")
(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))
(require 'muse-mode)
(require 'muse-html)
(require 'muse-wiki)
(require 'muse-latex)
(require 'muse-latex2png)
(require 'muse-texinfo)
(require 'muse-docbook)
(add-hook 'muse-mode-hook
 '(lambda ()
     (setq outline-regexp "\\*+ ")))
(require 'muse-html)

;html
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)

;;redo
(define-key global-map (kbd "C-/") 'undo)
(define-key global-map (kbd "C-x C-/") 'redo)


;; 一个使用recentf可以打开最近打开文件列表的功能
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("files: ") tocpl))
    ;;(prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-string fname tocpl)))))
(require 'recentf)

;;快速切换buffer
(require 'swbuff)
(setq swbuff-exclude-buffer-regexps
     '("^ " "\\*.*\\*"))
(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)


;; 观看kill-ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'emaxima-mode "emaxima" "Emaxima" t)
(add-hook 'emaxmia-mode-hook 'emaxima-mark-file-as-emaxima)
(autoload 'imaxima "imaxima" "Image support for Maxima." t)

;;‘color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-blue-gnus)
;(color-theme-classic)

;;保存桌面
;;(setq desktop-dirname "~/.emacs.d/"
;;desktop-base-file-name "emacs.desktop"
;;desktop-base-lock-name "lock"
;;desktop-path (list desktop-dirname)
;;desktop-save t
;;desktop-files-not-to-save "^$" ;reload tramp paths
;;desktop-load-locked-desktop nil)

;;(desktop-save-mode t)

;;----------日历设置--------------------

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t) ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil) ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))

;;Calendar模式支持各种方式来更改当前日期
;;（这里的"前"是指还没有到来的那一天，"后"是指已经过去的日子）
;; q 退出calendar模式
;; C-f 让当前日期向前一天
;; C-b 让当前日期向后一天
;; C-n 让当前日期向前一周
;; C-p 让当前日期向后一周
;; M-} 让当前日期向前一个月
;; M-{ 让当前日期向后一个月
;; C-x ] 让当前日期向前一年
;; C-x [ 让当前日期向后一年
;; C-a 移动到当前周的第一天
;; C-e 移动到当前周的最后一天
;; M-a 移动到当前月的第一天
;; M-e 多动到当前月的最后一天
;; M-< 移动到当前年的第一天
;; M-> 移动到当前年的最后一天

;;Calendar模式支持移动多种移动到特珠日期的方式
;; g d 移动到一个特别的日期
;; o 使某个特殊的月分作为中间的月分
;; . 移动到当天的日期
;; p d 显示某一天在一年中的位置，也显示本年度还有多少天。
;; C-c C-l 刷新Calendar窗口

;; Calendar支持生成LATEX代码。
;; t m 按月生成日历
;; t M 按月生成一个美化的日历
;; t d 按当天日期生成一个当天日历
;; t w 1 在一页上生成这个周的日历
;; t w 2 在两页上生成这个周的日历
;; t w 3 生成一个ISO-SYTLE风格的当前周日历
;; t w 4 生成一个从周一开始的当前周日历
;; t y 生成当前年的日历

;;EMACS Calendar支持配置节日：
;; h 显示当前的节日
;; x 定义当天为某个节日
;; u 取消当天已被定义的节日
;; e 显示所有这前后共三个月的节日。
;; M-x holiday 在另外的窗口的显示这前后三个月的节日。


;; 另外，还有一些特殊的，有意思的命令：
;; S 显示当天的日出日落时间(是大写的S)
;; p C 显示农历可以使用
;; g C 使用农历移动日期可以使用

;;-----------日历设置结束----------------

(put 'scroll-left 'disabled nil)

(setq load-path (cons "~/.emacs.d/site-lisp/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/site-lisp/org-mode/contrib/lisp" load-path))
(require 'org-install)
(require 'org-publish)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-ci" 'org-iswitchb)
(setq org-agenda-files (list "/cygdrive/f/Joseph_Zeng/notes/org/Diary/"
"/cygdrive/f/Joseph_Zeng/notes/org/Notes/"
"/cygdrive/f/Joseph_Zeng/notes/org/Private/"
"/cygdrive/f/Joseph_Zeng/notes/org/Tasks/"))

;; 定义快捷插入操作
(define-skeleton iexp
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
  ""
  "#+BEGIN_EXAMPLE\n"
  _ "\n"
  "#+END_EXAMPLE"
  )
(define-abbrev org-mode-abbrev-table "iexp" "" 'iexp)
(setq org-tag-alist '(
	("NR工作室" . ?n)
	("兼职" . ?j)
	("工作" . ?w)
	("笔记" . ?n)
	("日记" . ?d)
	("账号" . ?z)
	("学习" . ?s)
	("备注" . ?b)
	("小曾" . ?x)
))
(setq org-todo-keywords
    '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
     ))

(setq org-publish-project-alist
      '(("org"
         :base-directory "/cygdrive/f/Joseph_Zeng/notes/org"
         :publishing-directory "/cygdrive/f/Joseph_Zeng/notes/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/stylesheet.css\" \/>")
        ("note-static"
         :base-directory "/cygdrive/f/Joseph_Zeng/notes/org"
         :publishing-directory "/cygdrive/f/Joseph_Zeng/notes/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "josephzeng36@gmail.com"
         )))

(setq ac-modes
      (append ac-modes '(org-mode objc-mode jde-mode sql-mode
                                  change-log-mode text-mode
                                  makefile-gmake-mode makefile-bsdmake-mo
                                  autoconf-mode makefile-automake-mode)))

;;;TRAMP
(add-to-list 'load-path "~/.emacs.d/site-lisp/tramp/lisp/")
;;(require 'ange-ftp)
(require 'tramp)
(require 'tramp-util)
(setq tramp-verbose 10)
(setq tramp-debug-buffer t)
(setq tramp-disable-ange-ftp)
(setq tramp-default-method "plink") 
(setq tramp-ftp-method "scp")
(add-to-list 'Info-default-directory-list "~/.emacs.d/tramp/info/")
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;(setq load-path (cons "~/.emacs.d/site-lisp/epg" load-path))
;(require 'epa-file)
;(epa-file-enable)
;(setq epa-file-encrypt-to nil)
;(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;(setq epa-file-inhibit-auto-save nil)

;;ange-ftp
(require 'ange-ftp)

(require 'time-stamp)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format 
                          "由 %:u修改 时间：%04y-%02m-%02d %02H:%02M:%02S"
                          time-stamp-active t
                          time-stamp-warn-inactive t)

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/erc")
;;(require 'erc)
;;(require 'erc-list)
;;(require 'erc-nicklist)
;;(setq erc-default-coding-system '(utf-8 . utf-8))
;;(setq erc-nick "josephzeng"
;;      erc-user-full-name "Quan Zeng")
;;(erc-timestamp-mode 1)
;;(require 'erc-log)
;;(erc-log-mode 1)
;;(setq erc-log-channels-directory "~/.erc/"
;;      erc-save-buffer-on-part t
;;      erc-log-file-coding-system 'utf-8
;;      erc-log-write-after-send t
;;      erc-log-write-after-insert t)
;; 
;;(unless (file-exists-p erc-log-channels-directory)
;; (mkdir erc-log-channels-directory t))

; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %l:%M %a %p")))


;;yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(require 'sf)

(require 'jinja2-mode)
(require 'js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/zf")
;;(require 'zf-mode)
;;(zf-mode-setup)

;;evil
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil")
(require 'evil)
(evil-mode 1)

;;smex
(require 'smex)
(smex-initialize)