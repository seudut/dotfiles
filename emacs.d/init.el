;;;(if (eq system-type 'darwin)
;;;  (setenv "PATH"
;;;)   (concat (getenv "path") ":/usr/local/bin:~/bin/")
;;;  )


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq debug-on-error t)


(add-to-list 'load-path "~/.emacs.d/config")

(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)

(require 'init-base)

(require 'my-packages)

(require 'init-color-theme)
;(require 'init-ido)
(require 'init-magit)
;(require 'init-evil)
(require 'init-project)
(require 'init-ggtags)

(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)


;;;; conflict with C-c . in org-mode, disable it temporarily
;;;;(require 'init-c-cpp)
(require 'init-key-binding)
(require 'init-winner)
(require 'init-minibuffer)


;; http://stackoverflow.com/questions/11484225/fix-an-auto-complete-mode-and-linum-mode-annoyance
;;;(ac-linum-workaround)


(require 'init-mode-line)
(require 'init-workgroup2)
(require 'init-perl)

;(add-to-list 'load-path "~/.emacs.d/Emacs-PDE-0.2.16/lisp/")
;(load "pde-load")                       ;

(require 'init-linum)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)


(require 'init-helm)

;; page break configuration
;(require 'pp-c-l)
;(pretty-control-l-mode 1)

;; persist command history of helm
;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)


(require 'use-package)

;; persist command history of helm
(use-package savehist
  :init (savehist-mode)
  :config
  (setq history-length 1000
        history-delete-duplicates t
        savehist-additional-variables '(extended-command-history))) 

;;(savehist-mode)
;;  (setq history-length 1000
;;        history-delete-duplicates t
;;        savehist-additional-variables '(extended-command-history)) 

;    (setq split-height-threshold 0)
