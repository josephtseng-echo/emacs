;;init
(setq stack-trace-on-error nil)

(with-no-warnings
   (require 'cl))

(require 'init-base)
(require 'init-themes)
(require 'init-plug-in)
(require 'init-org)
;;(require 'init-auto-complete)
(require 'init-company-mode)
(require 'init-yasnippet)
(require 'init-func)
(require 'init-shortcuts)
(require 'init-evil)
(require 'init-helm)
(require 'init-calendar)
(provide 'init)