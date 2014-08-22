(add-to-list 'load-path "~/.emacs.d/site-lisp/plug-in/")

;;htmlize
(require 'htmlize)

;;popup
(require 'popup)

;;mode
(require 'php-mode)
(require 'js2-mode)
(require 'go-mode)
(require 'lua-mode)

;;ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(require 'ibuf-ext)
(require 'buff-menu+)
(setq ibuffer-sorting-mode 'recency)

(require 'linum+)
(global-linum-mode 1);;启用全局显示行号模式
(global-set-key (kbd "C-x N") 'linum-mode)
(set-face-background 'linum "blue")
(provide 'init-linum)

;;switch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;;ace-jump-mode
(require 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;autopair
(show-paren-mode t) ;; 匹配括号高亮
(require 'autopair)
(autopair-global-mode) ;; 自动补全括号
(require 'highlight-parentheses)

;;rainbow-mode
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode t)

(require 'icomplete) 
(icomplete-mode 99) ;;启用M-x命令提示
(eval-after-load "icomplete" '(progn (require 'icomplete+))) ;;icomplete模式增强

(add-to-list 'load-path  
             "~/.emacs.d/site-lisp/doxymacs");
(require 'doxymacs)
(defun my-doxymacs-font-lock-hook ()  
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))  
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(doxymacs-mode t)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'php-mode)

;;
(require 'undo-tree)
(global-undo-tree-mode)

;;redo+
(require 'redo+)
;;
(require 'browse-kill-ring);恢复

;; 去掉Ctrl+空格
(global-set-key (kbd "C-SPC") 'nil)

(require 'xcscope)
(require 'xcscope+)

;;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq dframe-update-speed t)
(global-set-key (kbd "<f5>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))

;;cursor-chg.el
(require 'cursor-chg)
(change-cursor-mode 1)
(toggle-cursor-type-when-idle 1)

(provide 'init-plug-in)