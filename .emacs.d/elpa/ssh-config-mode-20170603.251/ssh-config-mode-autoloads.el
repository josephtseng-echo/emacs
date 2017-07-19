;;; ssh-config-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ssh-config-mode" "ssh-config-mode.el" (22858
;;;;;;  17829 98436 87000))
;;; Generated autoloads from ssh-config-mode.el

(autoload 'ssh-config-mode "ssh-config-mode" "\
Major mode for fontifiying ssh config files.

\\{ssh-config-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("/\\.ssh/config\\'" . ssh-config-mode))

(add-to-list 'auto-mode-alist '("/sshd?_config\\'" . ssh-config-mode))

(add-to-list 'auto-mode-alist '("/known_hosts\\'" . ssh-known-hosts-mode))

(add-to-list 'auto-mode-alist '("/authorized_keys\\'" . ssh-authorized-keys-mode))

(autoload 'ssh-known-hosts-mode "ssh-config-mode" "\
Major mode for fontifiying ssh known_hosts files.
\\{ssh-known-hosts-mode}

\(fn)" t nil)
 (autoload 'ssh-authorized-keys-mode "ssh-config-mode" nil t)

;;;***

;;;### (autoloads nil nil ("ssh-config-mode-pkg.el") (22858 17829
;;;;;;  98436 87000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ssh-config-mode-autoloads.el ends here
