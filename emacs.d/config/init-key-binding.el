;; This  file is for some global key binding




(require 'key-chord)

(setq key-chord-two-keys-delay 0.2)

;; from emacs conference 2015 workshop
(defun keychord-keymap (keychord bindings)
  (setq keymap (make-sparse-keymap))
  (dolist (binding bindings)
    (define-key keymap (car binding) (cdr binding)))
  (key-chord-define-global keychord keymap))


(defun switch-to-previous-buffer ()
  "Switch to previously open buffer. Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))




;; main keymap
(keychord-keymap "ss"
                 '(("j" . helm-mini)
                   ("k" . find-file)
		   ("o" . delete-other-windows)))

;; misc
;; eval-buffer
;; packet-list-install
;; 


;; for some helm key mapping
(key-chord-define-global "sj" 'helm-mini)
(key-chord-define-global "sk" 'helm-find-files)

;;
(key-chord-define-global ";w" 'save-buffer)
(key-chord-define-global ";s" 'split-window-below)
(key-chord-define-global ";v" 'split-window-right)
(key-chord-define-global ";q" 'delete-window)

;(key-chord-define-global "x0" 'other-window)
;(key-chord-define-global "x1" 'delete-other-windows)


;; same  set ESC ESC as a prefix key map
;; Windows
;(global-set-key (kbd "<escape> M-a") 'find-file)
(global-set-key (kbd "<escape> M-o") 'delete-other-windows)
(global-set-key (kbd "<escape> M-h") 'other-window)
(global-set-key (kbd "<escape> M-j") 'find-file)
(global-set-key (kbd "<escape> M-k") 'find-file)
(global-set-key (kbd "<escape> M-l") 'find-file)


;; project
(global-set-key (kbd "<escape> M-n") 'find-file)
(global-set-key (kbd "<escape> M-m") 'find-file)
(global-set-key (kbd "<escape> M-p") 'find-file)
(global-set-key (kbd "<escape> M-u") 'find-file)
(global-set-key (kbd "<escape> M-y") 'find-file)
;(global-set-key (kbd "<escape> <escape>") 'find-file)


(key-chord-define-global "JJ" 'save-buffer)
(key-chord-define-global "HH" 'save-buffer)
(key-chord-define-global "KK" 'save-buffer)
(key-chord-define-global "LL" 'save-buffer)
(key-chord-define-global "LL" 'save-buffer)
(key-chord-define-global "UU" 'save-buffer)
(key-chord-define-global "II" 'save-buffer)
(key-chord-define-global "OO" 'save-buffer)
(key-chord-define-global "NN" 'save-buffer)
(key-chord-define-global "MM" 'save-buffer)
(key-chord-define-global "PP" 'save-buffer)
(key-chord-define-global "YY" 'save-buffer)




(key-chord-define minibuffer-local-map "qq" "\C-g")


(key-chord-define minibuffer-local-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-ns-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-isearch-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-completion-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-must-match-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-must-match-filename-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-filename-completion-map "jj"  'keyboard-escape-quit)
(key-chord-define minibuffer-local-filename-must-match-map "jj"  'keyboard-escape-quit)



(key-chord-mode 1)

;;;;;;;;;;;;;(provide 'init-keychord)


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
				
			      


;(global-set-key (kbd "M-g M-w") 'other-window)

;;----------------------------------------------------------------------------
;; C-o prefix binding for some File/Buffer switching/openning
;;
(global-unset-key "\C-o")
;;(global-set-key (kbd "C-o C-o") 'keyboard-quit);; same as C-g to quit
;;; c-o c-o swith to normal mode 
(global-set-key (kbd "C-o C-o") 'evil-normal-state)
;;(global-set-key (kbd "C-o C-o") 'fiplr-find-file)
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
