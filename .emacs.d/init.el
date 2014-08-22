;;init
(setq stack-trace-on-error nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(with-no-warnings
   (require 'cl))

(require 'init-base)
(require 'init-themes)
(require 'init-plug-in)
(require 'init-org)
(require 'init-auto-complete)
(require 'init-func)
(require 'init-shortcuts)
(require 'init-evil)
(provide 'init)