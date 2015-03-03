(add-to-list 'load-path "~/.emacs.d/site-lisp/company-mode-master/")
(require 'company)
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-common-hook
               'python-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook))
(add-hook hook 'company-mode))
(provide 'init-company-mode)


