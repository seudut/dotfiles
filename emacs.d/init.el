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
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-14" ))
(setq inhibit-startup-message t)

(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)
(blink-cursor-mode 0)


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
;(elscreen-start)
;(require 'init-elscreen)
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


(require 'init-evil)



;;---------------------------------------------------------------------------------------
;; Fiplr
;;
(setq fiplr-root-markers '(".git" ".svn" "*.DS_Store"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.o" ".obj" "*.swp" "*.hg" ".pyc" ".*" ))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)


;;---------------------------------------------------------------------------------------
;; sr-speedbar
;;
;(require 'sr-speedbar)
;(setq speedbar-use-images nil)
;(setq speedbar-show-unknown-files t)




(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'projectile-speedbar)

;(require 'cc-mode)
;(require 'ecb)

;(setq ecb-layout-name "leftright3")

;; gnu global support
;(require 'semantic/db)
;(global-semanticdb-minor-mode 1)

(require 'init-ggtags)


(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)


(require 'init-c-cpp)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 100)


(require 'recentf-ext)

(require 'init-key-binding)

(require 'linum-relative)
(winner-mode 1)

(global-set-key (kbd "C-c C-l") 'winner-redo)
(global-set-key (kbd "C-c C-h") 'winner-undo)



;(require 'minibuffer-tray)
;(require 'eyebrowse)
;(eyebrowse-mode t)

(require 'workgroups2)
;;;;(workgroups-mode 1)


(require 'minibuffer-line)
;(minibuffer-line-mode 1)


;(add-to-list 'load-path "~/.emacs.d/vendor")
;(require 'minibuffer-tray)
;(minibuffer-tray-mode 1)
;(require 'xwem-minibuffer)

; (run-at-time
;  nil 30
;  (lambda ()
;    (with-current-buffer " *Minibuf-0*"
;      (erase-buffer)
;      (dotimes (spaces (- (frame-width) 20))
;        (insert " "))
;      (insert (format-time-string "%m-%d  %I:%M %p %a ")))))

