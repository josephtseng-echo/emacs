;;cursor-chg.el
(require 'cursor-chg)
(change-cursor-mode 1)
(toggle-cursor-type-when-idle 1)

(require 'linum+)
(global-linum-mode 1);;启用全局显示行号模式
(global-set-key (kbd "C-x N") 'linum-mode)
(set-face-background 'linum "blue")
(provide 'init-linum)

;;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq dframe-update-speed t)
(global-set-key (kbd "<f5>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))

;;switch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;;winner mode
(winner-mode 1)
(when (fboundp 'winner-mode)
  (winner-mode) 
  (windmove-default-keybindings))
(global-set-key (kbd "C-x 4 u") 'winner-undo)
(global-set-key (kbd "C-x 4 r") 'winner-redo)

;;imenu+
(require 'imenu+)

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

;;
(require 'browse-kill-ring)
(require 'browse-kill-ring+)

;;zencoding
(require 'zencoding-mode)
(add-hook 'zencoding-mode-hook
          (define-key zencoding-mode-keymap (kbd "C-j") nil)
          (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
          (define-key zencoding-mode-keymap (kbd "C-c C-j") 'zencoding-expand-line))


;;autopair
(show-paren-mode t) ;; 匹配括号高亮
(require 'autopair)
(autopair-global-mode) ;; 自动补全括号

;;rainbow-mode
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode t)


(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(require 'ibuf-ext)
(require 'buff-menu+)
(setq ibuffer-sorting-mode 'recency)

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
(doxymacs-mode)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'doxymacs-mode)

;;
(require 'undo-tree)
(global-undo-tree-mode)

;;redo+
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)

;;
(require 'browse-kill-ring);恢复

;;multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-buffer-name "term")
(global-set-key "\C-x." 'multi-term)
(global-set-key "\C-x," 'multi-term-dedicated-open)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
(add-hook 'term-mode-hook
    #'(lambda ()
      (setq autopair-dont-activate t)
      (autopair-mode -1)))

;;;; 用点标记空格 美元号标记过行
;;(require 'whitespace)
;;(whitespace-turn-on)
;;(global-whitespace-mode t)
;;(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
;;(setq whitespace-display-mappings
;;      '(
;;        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
;;        (newline-mark 10 [182 10]) ; 10 LINE FEED
;;        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
;;        ))
;;
;;
(global-set-key (kbd "C-x g d") 'desktop-change-dir)
(setq session-key-dir-map '(("w" "~/.backups/emacs-session/work")
                            ("o" "~/.backups/emacs-session/other")
                            ))
(while session-key-dir-map
  (lexical-let* ((item (car session-key-dir-map))
                 (key (car item))
                 (path (car (cdr item))))
    (global-set-key (kbd (concat "C-x g g " key))
                    #'(lambda () (interactive) (desktop-change-dir path)))
    (setq session-key-dir-map (cdr session-key-dir-map)))
  )


;;
;;(require 'flymake)
;;(require 'flymake-css)
;;(add-hook 'css-mode-hook 'flymake-css-load)


;;markdown-mode
;;(require 'markdown-mode)
;;(autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(provide 'init-plug)
