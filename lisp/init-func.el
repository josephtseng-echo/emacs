;;
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `my-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (let ((case-fold-search nil))
    (if (eq n 1)
        (progn                            ; forward
          (search-forward (string char) nil nil n)
          (backward-char)
          (while (equal (read-key)
                        char)
            (forward-char)
            (search-forward (string char) nil nil n)
            (backward-char)))
      (progn                              ; backward
        (search-backward (string char) nil nil )
        (while (equal (read-key)
                      char)
          (search-backward (string char) nil nil )))))
  (setq unread-command-events (list last-input-event)))

;;insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %l:%M %a %p")))

(defun exit-emacs-client ()
  "consistent exit emacsclient.
   if not in emacs client, echo a message in minibuffer, don't exit emacs.
   if in server mode
      and editing file, do C-x # server-edit
      else do C-x 5 0 delete-frame"
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (delete-frame)))

;;inc-num-region把一段文本中重复出现的数字替换成递增的数字
(defun inc-num-region (p m)
  "Increments the numbers in a given region"
  (interactive "r")
  (save-restriction
    (save-excursion
      (narrow-to-region p m)    
      (goto-char (point-min))   
      (forward-line)
      (let ((counter 1))
        (while (not (eq (point)
                        (point-max)))
          (goto-char (point-at-eol))
          (search-backward-regexp "[0-9]+" (point-at-bol) t)
          (let* ((this-num (string-to-number (match-string 0)))
                 (new-num-str (number-to-string (+ this-num
                                                   counter))))
            (replace-match new-num-str)
            (incf counter)
            (forward-line)))))))

(global-set-key [(meta p)] 'move-line-up)
(global-set-key [(meta n)] 'move-line-down)
(defun move-line (&optional n)
      "Move current line N (1) lines up/down leaving point in place."
      (interactive "p")
      (when (null n)
        (setq n 1))
      (let ((col (current-column)))
        (beginning-of-line)
        (next-line 1)
        (transpose-lines n);
        (previous-line 1)
        (move-to-column col)))

(defun move-line-up (n)
      (interactive "p")
      "Moves current line N (1) lines up leaving point in place."
      (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
      "Moves current line N (1) lines down leaving point in place."
      (interactive "p")
      (move-line (if (null n) 1 n)))

(provide 'init-func)