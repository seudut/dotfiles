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
(setq inhibit-startup-message t)

(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)
(blink-cursor-mode 0)


(add-to-list 'auto-mode-alist '("emacs\\'" . emacs-lisp-mode))



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
;(require 'elscreen)
;(custom-set-faces
; '(elscreen-tab-current-screen-face ((t (:background "Yellow" :foreground "black"))))
; '(elscreen-tab-other-screen-face ((t (:background "gray22" :foreground "black")))))


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

(winner-mode 1)

(global-set-key (kbd "C-c C-l") 'winner-redo)
(global-set-key (kbd "C-c C-h") 'winner-undo)



;(require 'minibuffer-tray)
;(require 'eyebrowse)
;(eyebrowse-mode t)



;;(require 'minibuffer-line)
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




;;; set font size of minibuffer
;;;; http://stackoverflow.com/questions/7869429/altering-the-font-size-for-the-emacs-minibuffer-separately-from-default-emacs
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
       (set (make-local-variable 'face-remapping-alist)
          '((default :height 120))))



(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:background "green")))))




(require 'evil-escape)
;(setq-default evil-escape-delay 0.2)	
;(setq evil-escape-excluded-major-modes '(dired-mode))
;(setq-default evil-escape-key-sequence "jj")
;(evil-escape-mode 1)


;; ---------------
;; recent file
(require 'recentf)
(recentf-mode)
;(setq recentf-max-menu-items 100)

;; http://www.emacswiki.org/emacs/RecentFiles
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))



;; http://stackoverflow.com/questions/11484225/fix-an-auto-complete-mode-and-linum-mode-annoyance
(ac-linum-workaround)


;; ---------------------------------
;; linum-relative

(require 'linum-relative)

(custom-set-variables
 '(fringe-mode (quote (4 . 0)) nil (fringe)))

;; maybe better to fix the size of line number rather scaled 0.8
;; https://github.com/howardabrams/dot-files/blob/master/emacs.org
(custom-set-faces
 '(highlight-current-line-face ((t (:background "gray22"))))
 '(linum ((t (:background "#000000" :foreground "gray40" :height 0.8 :slant italic :weigth light))))
 '(linum-relative-current-face ((t (:inherit linum :foreground "Yellow" :weight light :height 0.8)))))


;; enable linum-relative in programming mode
;https://github.com/howardabrams/dot-files/blob/master/emacs.org
(add-hook 'prog-mode-hook 'linum-mode)


;; hight current line
(require 'highlight-current-line)
(highlight-current-line-on t)



;(defun pl-fringe-mode ()
;  "jfoewoif"
;  (if linum-mode
;      (fringe-mode '(4 . 0))
;    (fringe-mode '(0 . 0))))


;(add-hook 'eshell-mode-hook 'pl-fringe-mode)
;(add-hook 'prog-mode-hook 'pl-fringe-mode)





(require 'workgroups2)


(setq wg-prefix-key (kbd "C-c z"))
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")
;(workgroups-mode 1)

