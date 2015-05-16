(setq debug-on-error t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 40))
;(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12:weight:light" ))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12" ))

(display-time-mode t)

(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)

(setq ns-use-srgb-colorspace nil)
(add-to-list 'auto-mode-alist '("emacs\\'" . emacs-lisp-mode))
(fringe-mode 0)

;
;;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border 
                        (make-glyph-code ?┃))

;;---------------------------------------------------------------------------------------
;; package
;; http://y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    magit
    helm
    ido-ubiquitous
    yasnippet
    evil
    ido-vertical-mode
    smex
    color-theme
    color-theme-sanityinc-tomorrow
    key-chord
    powerline-evil
    powerline
    evil-leader
    flx-ido
    flx
    auto-complete
    fiplr
    w3m
    ace-jump-mode
;    el-get
    color-identifiers-mode
    elscreen
    moe-theme
    monokai-theme
    molokai-theme
;    tangotango-theme
    cyberpunk-theme
  ) "a list of packages to ensure are installed at launch.")

(require 'cl)
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

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
;			    (nrepl-mode . insert)
;			    (pylookup-mode . emacs)
;			    (comint-mode . normal)
;			    (shell-mode . emacs)
;			    (git-commit-mode . insert)
;			    (git-rebase-mode . emacs)
;			    (term-mode . emacs)
;			    (help-mode . emacs)
;			    (helm-grep-mode . emacs)
;			    (grep-mode . emacs)
;			    (bc-menu-mode . emacs)
;			    (magit-branch-manager-mode . emacs)
;			    (rdictcc-buffer-mode . emacs)
;			    (dired-mode . emacs)
;			    (wdired-mode . normal)
			    (eshell-mode . emacs))
    do (evil-set-initial-state mode state))

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
;; Wind-move
;;
(set-face-attribute 'vertical-border nil  :foreground "gray")

;;---------------------------------------------------------------------------------------
;; El-get
;; https://github.com/dimitri/el-get
;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


(el-get-bundle seudut/color-theme-tangotango
;        :features color-theme-tangotango
;        (color-theme-tangotango)
        )

;;---------------------------------------------------------------------------------------
;; Config folder
;; 
(add-to-list 'load-path "~/.emacs.d/config")
(require 'init-color-theme)




