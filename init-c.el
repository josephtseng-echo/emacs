(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun my-doxymacs-font-lock-hook ()  
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))  
      (doxymacs-font-lock)))  
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(require 'google-c-style)  
(add-hook 'c-mode-common-hook 'google-set-c-style)  
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'init-c)