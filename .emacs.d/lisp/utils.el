;;; utils.el ---
;;
;; Filename: utils.el
;; Author: josephzeng <josephzeng36@gmail.com>
;; Created:  2022-04-03 14:18:29
;; Last-Update: 2021-01-26 14:34:06 (HKT)

(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil
                          :family "LigaSauceCodeProMedium Nerd Font"
                          :height 130
                          :weight 'Normal)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset (font-spec :family "Microsoft Yahei"
                                             :size 13)))
      (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                     (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                     (36 . ".\\(?:>\\)")
                     (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                     (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                     (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                     (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                     (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                     (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                     (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                     (48 . ".\\(?:x[a-zA-Z]\\)")
                     (58 . ".\\(?:::\\|[:=]\\)")
                     (59 . ".\\(?:;;\\|;\\)")
                     (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                     (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                     (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                     (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                     (91 . ".\\(?:]\\)")
                     (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                     (94 . ".\\(?:=\\)")
                     (119 . ".\\(?:ww\\)")
                     (123 . ".\\(?:-\\)")
                     (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                     (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                     )
                   ))
      (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                                `([,(cdr char-regexp) 0 font-shape-gstring]))))
))

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-c g") 'avy-goto-line)
(global-set-key (kbd "C-x g d") 'desktop-change-dir)

(defun compile-init ()
  "Byte recompile user Emacs directory."
  (interactive)
  (byte-recompile-directory user-emacs-directory))

(defun copy-buffer-file-name ()
  "Put current buffer's base name into the kill ring."
  (interactive)
  (when (buffer-file-name)
    (kill-new (f-filename (buffer-file-name)))))

(defun toggle-show-buffer-file-name ()
  "toggle show or hide buffer full file name in mode line"
  (interactive)
  (setq show-buffer-file-name
	(if show-buffer-file-name nil t)))

(defvar astyle-command "astyle --style=linux -A10 -j -O -o -c -k3 -s4 -H -S -Y")

(defun astyle (start end)
  "Run astyle on region or buffer"
  (interactive (if mark-active
		   (list (region-beginning) (region-end))
		 (list (point-min) (point-max))
		 ))
  (save-restriction
    (shell-command-on-region start end
			     astyle-command
			     (current-buffer) t
			     (get-buffer-create "*Astyle Errors*") t)))

(defun comment-or-uncomment-region-or-line()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (progn
          (setq beg (region-beginning) end (region-end))
          (save-excursion
            (setq beg (progn (goto-char beg) (line-beginning-position))
                  end (progn (goto-char end) (line-end-position)))))
      (setq beg (line-beginning-position)
            end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '("/tmp/" "/ssh:"))

(global-set-key (kbd "M-o") 'ace-window)


(defvar my-desktop-session-dir
    (concat (getenv "HOME") "/.emacs.d/desktop-sessions/")
	  "*Directory to save desktop sessions in")

(defvar my-desktop-session-name-hist nil
    "Desktop session name history")

(defun my-desktop-save (&optional name)
    "Save desktop with a name."
	  (interactive)
	    (unless name
		      (setq name (my-desktop-get-session-name "Save session as: ")))
		  (make-directory (concat my-desktop-session-dir name) t)
		    (desktop-save (concat my-desktop-session-dir name) t))

(defun my-desktop-read (&optional name)
    "Read desktop with a name."
	  (interactive)
	    (unless name
		      (setq name (my-desktop-get-session-name "Load session: ")))
		  (desktop-read (concat my-desktop-session-dir name)))

(defun my-desktop-get-session-name (prompt)
    (completing-read prompt (and (file-exists-p my-desktop-session-dir)
    (directory-files my-desktop-session-dir))
    nil nil nil my-desktop-session-name-hist))

(defun @-close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun @-minify-buffer-contents()
  (interactive)
  (mark-whole-buffer)
  (goto-char (point-min))
  (while (search-forward-regexp "[\s\n]*" nil t) (replace-match "" nil t)))

(defun remove-dos-eol ()
    "Do not show ^M in files containing mixed UNIX and DOS line endings."
	  (interactive)
	    (setq buffer-display-table (make-display-table))
		  (aset buffer-display-table ?\^M []))


(provide 'utils)
