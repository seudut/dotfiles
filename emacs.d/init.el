;;;(if (eq system-type 'darwin)
;;;  (setenv "PATH"
;;;)   (concat (getenv "path") ":/usr/local/bin:~/bin/")
;;;  )


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq debug-on-error t)


(add-to-list 'load-path "~/.emacs.d/config")

(require 'init-base)

(require 'my-packages)

(require 'init-color-theme)

(require 'init-ido)

(require 'init-magit)

(require 'init-evil)

(require 'init-project)

(require 'projectile-speedbar)


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




;;;;;(require 'escape)
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (4 . 0)) nil (fringe))
 '(ggtags-split-window-function (quote split-window-vertically))
 '(hes-mode-alist
   (quote
    ((c-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]+\\|u[[:xdigit:]]\\{4\\}\\|U[[:xdigit:]]\\{8\\}\\|[\"'?\\abfnrtv]\\)\\)")
     (cperl-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]+\\|u[[:xdigit:]]\\{4\\}\\|U[[:xdigit:]]\\{8\\}\\|[\"'?\\abfnrtv]\\)\\)")
     (c++-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]+\\|u[[:xdigit:]]\\{4\\}\\|U[[:xdigit:]]\\{8\\}\\|[\"'?\\abfnrtv]\\)\\)")
     (objc-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]+\\|u[[:xdigit:]]\\{4\\}\\|U[[:xdigit:]]\\{8\\}\\|[\"'?\\abfnrtv]\\)\\)")
     (java-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|u[[:xdigit:]]\\{4\\}\\|[\"'\\bfnrt]\\)\\)")
     (js-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]\\{2\\}\\|u[[:xdigit:]]\\{4\\}\\|.\\)\\)")
     (js2-mode . "\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]\\{2\\}\\|u[[:xdigit:]]\\{4\\}\\|.\\)\\)")
     (ruby-mode
      ("\\(\\\\\\([0-7]\\{1,3\\}\\|x[[:xdigit:]]\\{1,2\\}\\|u\\(?:[[:xdigit:]]\\{4\\}\\|{[[:xdigit:]]\\{1,6\\}\\(?:[[:space:]]+[[:xdigit:]]\\{1,6\\}\\)*}\\)\\|.\\)\\)"
       (0
        (let*
            ((state
              (syntax-ppss))
             (term
              (nth 3 state)))
          (when
              (or
               (and
                (eq term 39)
                (member
                 (match-string 2)
                 (quote
                  ("\\" "'"))))
               (if
                   (fboundp
                    (quote ruby-syntax-expansion-allowed-p))
                   (ruby-syntax-expansion-allowed-p state)
                 (memq term
                       (quote
                        (34 47 10 96 t)))))
            (add-face-text-property
             (match-beginning 1)
             (match-end 1)
             (quote hes-escape-backslash-face))
            (add-face-text-property
             (match-beginning 2)
             (match-end 2)
             (quote hes-escape-sequence-face))
            nil))
        prepend))))))
 '(org-agenda-files (quote ("~/Private/org/diary.org" "~/temp/org-note.org")))
 '(powerline-text-scale-factor 0.85))

;; maybe better to fix the size of line number rather scaled 0.8
;; https://github.com/howardabrams/dot-files/blob/master/emacs.org
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "gray22"))))
 '(linum ((t (:background "#000000" :foreground "gray40" :height 0.8 :slant italic :weigth light))))
 '(linum-relative-current-face ((t (:inherit linum :foreground "Yellow" :weight light :height 0.8))))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil :family "Source Code Pro for Powerline" :height 100))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil :family "Source Code Pro for Powerline" :height 100)))))


;; enable linum-relative in programming mode
;https://github.com/howardabrams/dot-files/blob/master/emacs.org
(add-hook 'prog-mode-hook 'linum-mode)


;; hight current line
(require 'highlight-current-line)
(highlight-current-line-on t)




(require 'workgroups2)


(setq wg-prefix-key (kbd "C-c z"))
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")
;(workgroups-mode 1)

(defalias 'perl-mode 'cperl-mode)
;(setq cperl-invalid-face nil)
 (setq cperl-invalid-face (quote off))
;(add-hook 'prog-mode-hook '(lambda () 
;        (highlight-regexp "%[[:alpha:]]\\|\\\\[[:alpha:]]")))

(require 'highlight-escape-sequences)
(hes-mode)
;(setq cperl-font-lock t)
(put 'hes-escape-backslash-face 'face-alias 'font-lock-builtin-face)
(put 'hes-escape-sequence-face 'face-alias 'font-lock-builtin-face)


;(add-to-list 'load-path "~/.emacs.d/Emacs-PDE-0.2.16/lisp/")
;(load "pde-load")                       ;

(require 'init-linum)
