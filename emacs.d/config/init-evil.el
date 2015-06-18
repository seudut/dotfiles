
;;---------------------------------------------------------------------------------------
;; evil
;;

(require 'evil)
(defalias 'evil-insert-state 'evil-emacs-state)
;; C-o C-o switch to normal mode, defined in config/init-key-binding.el
;;;(global-set-key (kbd "C-o C-o") 'evil-normal-state)

;;https://github.com/toumorokoshi/yt.rc/blob/master/emacs/my-evil.el
;; let's disable keymaps we don't want.
;; basically, anything that uses C or M
(define-key evil-visual-state-map "\C-w" nil)
;(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map "\C-t" nil)
(define-key evil-normal-state-map "\C-p" nil)
(define-key evil-normal-state-map "\C-n" nil)
(define-key evil-normal-state-map "\C-k" nil)
(define-key evil-normal-state-map "\C-l" nil)
(define-key evil-normal-state-map "\C-k" nil)
(define-key evil-normal-state-map "\C-j" nil)
(define-key evil-normal-state-map "\C-o" nil)


(global-evil-leader-mode)
(evil-leader/set-leader ";")
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key "b" 'switch-to-buffer)
(evil-leader/set-key "w" 'evil-write)

(evil-leader/set-key "s" 'split-window-below)
(evil-leader/set-key "v" 'split-window-right)
(evil-leader/set-key "q" 'delete-window)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)

(key-chord-mode 1)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)

;(define-key minibuffer-local-map [jscape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


;; cursor shape
;(setq evil-emacs-state-cursor '("red" box))
(setq evil-emacs-state-cursor '("red" bar))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
;;Enter an emacs mode in a given state http://wikemacs.org/wiki/Evil
(loop for (mode . state) in '(
                  (nrepl-mode . insert)
                  (pylookup-mode . emacs)
                  (comint-mode . normal)
                  (shell-mode . insert)
                  (git-commit-mode . insert)
                  (git-rebase-mode . emacs)
                  (term-mode . emacs)
                  (help-mode . emacs)
                  (helm-grep-mode . emacs)
                  (grep-mode . emacs)
                  (bc-menu-mode . emacs)
                  (magit-branch-manager-mode . emacs)
                  (rdictcc-buffer-mode . emacs)
                  (dired-mode . emacs)
                  (wdired-mode . normal)
;			    (inferior-emacs-lisp-mode . emacs)
;			    (wdired-mode . normal)
			    (eshell-mode . emacs))
    do (evil-set-initial-state mode state))


;(global-evil-tabs-mode t)
(evil-mode 1)

(provide 'init-evil)
