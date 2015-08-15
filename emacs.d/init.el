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
(require 'init-ggtags)

(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)


(require 'init-c-cpp)
(require 'init-key-binding)
(require 'init-winner)
(require 'init-minibuffer)


;; http://stackoverflow.com/questions/11484225/fix-an-auto-complete-mode-and-linum-mode-annoyance
(ac-linum-workaround)


(require 'init-mode-line)
(require 'init-workgroup2)
(require 'init-perl)

;(add-to-list 'load-path "~/.emacs.d/Emacs-PDE-0.2.16/lisp/")
;(load "pde-load")                       ;

(require 'init-linum)
