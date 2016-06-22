
;;(add-hook 'eshell-mode-hook
;;	  (lambda ()
;;	    (linum-mode -1)
;;	    (highlight-current-line-on nil)))

(setenv "PATH"
        (concat
         "/usr/local/bin:/usr/local/sbin:"
         (getenv "PATH")))

(setq eshell-scroll-to-bottom-on-input t)


;; copied from howardabrams's config
(defun eshell/gst (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))  



(add-hook 'eshell-mode-hook
   (lambda ()
      (add-to-list 'eshell-visual-commands "ssh")
      (add-to-list 'eshell-visual-commands "tail")))

; copied from howard's github
(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (if (> (length git-output) 0)
          (concat " :" (substring git-output 0 -1))
        "(no branch)"))))




(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))




(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last two."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 2)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                               (substring elm 0 1)))
                    (butlast p-lst 2)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 2)
                    "/"))
      pwd  ;; Otherwise, we just return the PWD
      )))

;; Turn off the default prompt.
(setq eshell-highlight-prompt nil)




(defun split-directory-prompt (directory)
  (if (string-match-p ".*/.*" directory)
      (list (file-name-directory directory) (file-name-base directory))
    (list "" directory)))


(setq eshell-prompt-function
      (lambda ()
        (let* ((directory (split-directory-prompt (pwd-shorten-dirs (pwd-replace-home (eshell/pwd)))))
               (parent (car directory))
               (name (cadr directory))
               (branch (or (curr-dir-git-branch-string (eshell/pwd)) "")))

          (if (eq 'dark (frame-parameter nil 'background-mode))
              (concat   ;; Prompt for Dark Themes
               (propertize parent 'face `(:foreground "#8888FF"))
               (propertize name   'face `(:foreground "#8888FF" :weight bold))
               (propertize branch 'face `(:foreground "green"))
               (propertize " $"   'face `(:weight ultra-bold))
               (propertize " "    'face `(:weight bold)))

            (concat    ;; Prompt for Light Themes
             (propertize parent 'face `(:foreground "blue"))
             (propertize name   'face `(:foreground "blue" :weight bold))
             (propertize branch 'face `(:foreground "dark green"))
             (propertize " $"   'face `(:weight ultra-bold))
             (propertize " "    'face `(:weight bold)))))))



(setq eshell-highlight-prompt nil)



(when (require 'esh-buf-stack nil t)
  (setup-eshell-buf-stack)
  (add-hook 'eshell-mode-hook
            (lambda () (local-set-key (kbd "M-q") 'eshell-push-command))))

(defun eshell/x ()
  "Closes the EShell session and gets rid of the EShell window."
  (kill-buffer)
  (delete-window))


(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)



(add-hook 'eshell-mode-hook
     (lambda ()
       (local-set-key (kbd "M-P") 'eshell-previous-prompt)
       (local-set-key (kbd "M-N") 'eshell-next-prompt)
       (local-set-key (kbd "M-R") 'eshell-list-history)
       (local-set-key (kbd "M-r")
              (lambda ()
                (interactive)
                (insert
                 (ido-completing-read "Eshell history: "
                                      (delete-dups
                                       (ring-elements eshell-history-ring))))))))




(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)



(defun execute-command-on-file-buffer (cmd)
  (interactive "sCommand to execute: ")
  (let* ((file-name (buffer-file-name))
         (full-cmd (concat cmd " " file-name)))
    (shell-command full-cmd)))

(defun execute-command-on-file-directory (cmd)
  (interactive "sCommand to execute: ")
  (let* ((dir-name (file-name-directory (buffer-file-name)))
         (full-cmd (concat "cd " dir-name "; " cmd)))
    (shell-command full-cmd)))

(global-set-key (kbd "A-1") 'execute-command-on-file-buffer)
(global-set-key (kbd "A-!") 'execute-command-on-file-directory)





;; alias

(defalias 'e 'find-file)
(defalias 'ee 'find-file-other-window)



(provide 'init-eshell)
