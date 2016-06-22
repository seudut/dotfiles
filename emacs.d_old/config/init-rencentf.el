
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)

;; http://www.emacswiki.org/emacs/RecentFiles
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))


(require 'recentf-ext)

(provide 'init-recentf)
