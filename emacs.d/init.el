;;;(if (eq system-type 'darwin)
;;;  (setenv "PATH"
;;;)   (concat (getenv "path") ":/usr/local/bin:~/bin/")
;;;  )


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

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
(global-set-key (kbd "C-x g") 'magit-status)
;(setq magit-auto-revert-mode nil)


;(require 'init-evil)



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


;(toggle-frame-fullscreen)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'projectile-speedbar)

;(require 'cc-mode)
;(require 'ecb)

;(setq ecb-layout-name "leftright3")


;(setq mac-command-modifier 'super) ; make cmd key do Meta
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)




(global-set-key (kbd "M-g M-v") 'split-window-right)
(global-set-key (kbd "M-g M-s") 'split-window-below)
(global-set-key (kbd "M-g M-o") 'delete-other-windows)

(global-set-key (kbd "M-g M-w") 'other-window)

;; gnu global support
;(require 'semantic/db)
;(global-semanticdb-minor-mode 1)

(require 'init-ggtags)

(global-unset-key "\C-o")
(global-set-key (kbd "C-o C-o") 'keyboard-quit);; same as C-g to quit
(global-set-key (kbd "C-o C-f") 'ido-find-file)
(global-set-key (kbd "C-o C-r") 'recentf-ido-find-file)
(global-set-key (kbd "C-o C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-o C-j") 'ido-find-file)


(global-set-key (kbd "C-o C-g") 'ggtags-find-file)
(global-set-key (kbd "C-o C-t") 'ggtags-find-tag-dwim)

(global-set-key (kbd "M-g M-g") 'magit-status)


(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)


(require 'init-c-cpp)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(require 'recentf-ext)
