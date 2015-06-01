;; This  file is for some global key binding

;;----------------------------------------------------------------------------
;; super prefix binding for elscreen TAB/Windows operation
;
(setq mac-command-modifier 'super) ; make cmd key do Meta

;; super key for elscreen tabs
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "s-t") 'elscreen-create)
(global-set-key (kbd "s-n") 'elscreen-next)
(global-set-key (kbd "s-p") 'elscreen-previous)
;;(global-set-key (kbd "s-k") (lambda () (interactive) (elscreen-kill (elscreen-get-current-screen))))
;;(global-set-key (kbd "s-d") (lambda () (interactive) (elscreen-kill (elscreen-get-current-screen))))
;; C-c C-d

(global-set-key (kbd "s-`") (lambda () (interactive) (elscreen-goto 0)))
(global-set-key (kbd "s-1") (lambda () (interactive) (elscreen-goto 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (elscreen-goto 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (elscreen-goto 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (elscreen-goto 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (elscreen-goto 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (elscreen-goto 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (elscreen-goto 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (elscreen-goto 8)))

;; super key for windows
(global-set-key (kbd "s-l") 'split-window-below)
(global-set-key (kbd "s-h") 'split-window-right)
(global-set-key (kbd "s-i") 'other-window)
(global-set-key (kbd "s-j") 'delete-other-windows)

(global-set-key (kbd "s-k") (lambda () (interactive)
			      (split-window-right)
			      (other-window 1)
			      (ido-find-file)))
				
			      



;(global-set-key (kbd "M-g M-v") 'split-window-right)
;(global-set-key (kbd "M-g M-s") 'split-window-below)
;(global-set-key (kbd "M-g M-o") 'delete-other-windows)


;(global-set-key (kbd "M-g M-w") 'other-window)

;;----------------------------------------------------------------------------
;; C-o prefix binding for some File/Buffer switching/openning
;;
(global-unset-key "\C-o")
;;(global-set-key (kbd "C-o C-o") 'keyboard-quit);; same as C-g to quit
(global-set-key (kbd "C-o C-o") 'fiplr-find-file)
(global-set-key (kbd "C-o C-f") 'ido-find-file)
(global-set-key (kbd "C-o C-n") 'recentf-ido-find-file)
(global-set-key (kbd "C-o C-j") 'ido-switch-buffer)
;(global-set-key (kbd "C-o C-j") 'ido-find-file)


(global-set-key (kbd "C-o C-g") 'ggtags-find-file)
(global-set-key (kbd "C-o C-t") 'ggtags-find-tag-dwim)

(global-set-key (kbd "M-g M-g") 'magit-status)


(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))


;;----------------------------------------------------------------------------
;; M-g prefix binding for some commands
;;



(provide 'init-key-binding)
