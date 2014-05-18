(defun org-mode-C-c-spc ()
  (define-key org-mode-map (kbd "C-c SPC") nil))
(add-hook 'org-mode-hook 'org-mode-C-c-spc)

(global-set-key (kbd "C-y") 'browse-kill-ring)

(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-0") 'delete-window)

(global-set-key (kbd "C-c q") 'exit-emacs-client)

;;
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-0") 'delete-window)

;;
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;
(global-set-key (kbd "<C-up>") 'tabbar-backward-group)
(global-set-key (kbd "<C-down>") 'tabbar-forward-group)
(global-set-key (kbd "<C-left>") 'tabbar-backward)
(global-set-key (kbd "<C-right>") 'tabbar-forward)

(global-set-key [f2] 'undo)
(global-set-key [f3] 'ibuffer)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f6] 'replace-string)
(global-set-key [f8] 'save-buffer);

(global-set-key (kbd "C-t") 'my-go-to-char)

(provide 'init-shortcuts)
