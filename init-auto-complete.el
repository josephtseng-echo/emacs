(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete/")
;;(require 'auto-complete)
(require 'auto-complete-config)
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色  
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动  
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-show-menu 0)
;;(setq ac-auto-start 4)
;;(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-l") 'auto-complete)
(setq ac-auto-start nil) 
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(setq ac-fuzzy-enable t)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(provide 'init-auto-complete)