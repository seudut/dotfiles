(setq debug-on-error t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 40))
;(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12:weight:light" ))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12" ))


(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)


(add-to-list 'auto-mode-alist '("emacs\\'" . emacs-lisp-mode))
(fringe-mode 0)



;;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border 
                        (make-glyph-code ?┃))

(set-face-attribute 'vertical-border nil  :foreground "gray")


(add-to-list 'load-path "~/.emacs.d/config")
(require 'my-packages)

;; elscreen should be placed begin of https://github.com/knu/elscreen/issues/6
(elscreen-start)
(require 'init-elscreen)
(require 'init-color-theme)
;(require 'init-my-theme-2)

;---------------------------------------------------------------------------------------
;; Ido
;;
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smex
(require 'smex) 
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;---------------------------------------------------------------------------------------
;; Magit
;;
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")
;(setq magit-auto-revert-mode nil)




;;---------------------------------------------------------------------------------------
;; evil
;;
(global-evil-leader-mode)
(evil-leader/set-leader ";")
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key "b" 'switch-to-buffer)
(evil-leader/set-key "w" 'evil-write)
(require 'evil)
;(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; cursor shape
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
;;Enter an emacs mode in a given state http://wikemacs.org/wiki/Evil
(loop for (mode . state) in '(
;			    (inferior-emacs-lisp-mode . emacs)
;			    (wdired-mode . normal)
			    (eshell-mode . emacs))
    do (evil-set-initial-state mode state))


;(global-evil-tabs-mode t)
;(evil-mode 1)
;;---------------------------------------------------------------------------------------
;; Fiplr
;;
(setq fiplr-root-markers '(".git" ".svn" "*.DS_Store"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.o" ".obj" "*.swp" "*.hg" ".pyc" ".*" ))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)

;;---------------------------------------------------------------------------------------
;; Wind-move
;;
(global-set-key (kbd "C-x C-l") 'windmove-right)
(global-set-key (kbd "C-x C-h") 'windmove-left)
(global-set-key (kbd "C-x C-k") 'windmove-up)
(global-set-key (kbd "C-x C-j") 'windmove-down)

;;---------------------------------------------------------------------------------------
;; sr-speedbar
;;
;(require 'sr-speedbar)
;(setq speedbar-use-images nil)
;(setq speedbar-show-unknown-files t)


(toggle-frame-fullscreen)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'projectile-speedbar)

(require 'cc-mode)
(require 'ecb)

(setq ecb-layout-name "leftright3")


;(setq mac-command-modifier 'super) ; make cmd key do Meta
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)




(global-set-key (kbd "M-g M-v") 'split-window-right)
(global-set-key (kbd "M-g M-s") 'split-window-below)
(global-set-key (kbd "M-g M-o") 'delete-other-windows)

(global-set-key (kbd "M-g M-w") 'other-window)

;(global-set-key (kbd "C-g C-k") 'windmove-up)
;(global-set-key (kbd "C-g C-j") 'windmove-down)

;;;; show default directory on mode-line

