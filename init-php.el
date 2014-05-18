(autoload 'php-mode "~/.emacs.d/site-lisp/php-mode.el" "Major mode for editing php code." t) 
(add-to-list 'auto-mode-alist '("\\.php\\'\\|\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
          '(lambda ()
         (setq tab-width 4
           c-basic-offset 4
           )))
(provide 'init-php)