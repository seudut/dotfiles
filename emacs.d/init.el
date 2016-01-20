

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

 (load-library "url-handlers")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; package manager
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;;;;; load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; load elisp config
(require 'init-base)
(require 'init-magit)
(require 'init-helm)
(require 'init-projectile)
(require 'init-org)









(use-package ido-vertical-mode
  :ensure t)


(use-package hydra
  :ensure t
  :config
  (hydra-add-font-lock))


;;;;;;;;;
(use-package ace-jump-mode
  :commands ace-jump-mode
  :init
  (bind-key "C-." 'ace-jump-mode))













;(add-to-list 'load-path "~/.emacs.d/config")

;; remove custom setting out of init.el
;; http://emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
;(setq custom-file "~/.emacs.d/custom.el")
;(load custom-file 'noerror)
;(require 'my-packages)
;(require 'init-base)
;(require 'init-font)

;(require 'init-helm)

;(require 'init-color-theme)
;(require 'init-color-theme-2)
;(require 'init-ido)
;(require 'init-magit)
;(require 'init-evil)
;(require 'init-project)
;(require 'init-ggtags)

;(require 'init-projectile)

;;;; conflict with C-c . in org-mode, disable it temporarily
;;;;(require 'init-c-cpp)
;(require 'init-key-binding)
;(require 'init-winner)
;(require 'init-minibuffer)
;(require 'init-eshell)

;; http://stackoverflow.com/questions/11484225/fix-an-auto-complete-mode-and-linum-mode-annoyance
;;;(ac-linum-workaround)


;(require 'init-mode-line)
;(require 'init-workgroup2)
;(require 'init-perl)

;(add-to-list 'load-path "~/.emacs.d/Emacs-PDE-0.2.16/lisp/")
;(load "pde-load")                       ;

;(require 'init-linum)

;(require 'auto-complete)
;(require 'auto-complete-config)
;(ac-config-default)




;; page break configuration
;(require 'pp-c-l)
;(pretty-control-l-mode 1)

;; persist command history of helm
;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)


;(require 'use-package)

;; persist command history of helm
;(use-package savehist
;  :init (savehist-mode)
;  :config
;  (setq history-length 1000
;        history-delete-duplicates t
;        savehist-additional-variables '(extended-command-history))) 

;;(savehist-mode)
;;  (setq history-length 1000
;;        history-delete-duplicates t
;;        savehist-additional-variables '(extended-command-history)) 

;    (setq split-height-threshold 0)





;;;(require 'helm-gtags)
;;;;(require 'setup-helm-gtags)
;;;;(helm-gtags-mode 1)
;;;;;; Enable helm-gtags-mode
;;;(add-hook 'c-mode-hook 'helm-gtags-mode)
;;;(add-hook 'c++-mode-hook 'helm-gtags-mode)
;;;(add-hook 'asm-mode-hook 'helm-gtags-mode)
;;;
;;;;; customize
;;;(custom-set-variables
;;; '(helm-gtags-path-style 'relative)
;;; '(helm-gtags-ignore-case t)
;;; '(helm-gtags-auto-update t))
;;;
;;;;; key bindings
;;;(eval-after-load "helm-gtags"
;;;  '(progn
;;;     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
;;;     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;;;     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;;;     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;;;     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;;     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;;     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))


;(require 'icicles)
;(icy-mode 1)


;;(require 'init-org)
;(setq help-window-select t)



;(require 'init-keychord)

;(setq hydra-examples-verbatim t)
;(require 'init-hydra)


;(require 'ace-window)
;(global-set-key (kbd "M-p") 'ace-window)


;(require 'init-multi-term)
;(require 'init-projectile)

;(require 'page-break-lines)
;(turn-on-page-break-lines-mode)
;(global-page-break-lines-mode 1)

;(setq projectile-completion-system 'helm)
;(helm-projectile-on)


;; show projectile name in mode-line


;(if (locate-library "ediff")
;    (progn
;      (autoload 'ediff-files "ediff")
;      (autoload 'ediff-buffers "ediff")
;
;       (eval-after-load "ediff" '(progn
;  			  (message "doing ediff customisation")
;			  (setq diff-switches               "-u"
;				ediff-custom-diff-options   "-U3"
;				ediff-split-window-function 'split-window-horizontally
;				ediff-window-setup-function 'ediff-setu;p-windows-plain)
;
;			  (add-hook 'ediff-startup-hook 'ediff-toggle-w;ide-display)
;			  (add-hook 'ediff-cleanup-hook 'ediff-toggle-w;ide-display)
;			  (add-hook 'ediff-suspend-hook 'ediff-toggle-wide-display)))))



;(defun update-diff-colors ()
;  "update the colors for diff faces"
;  (set-face-attribute 'diff-added nil
;                      :foreground "white" :background "blue")
;  (set-face-attribute 'diff-removed nil
;                      :foreground "white" :background "red3")
;  (set-face-attribute 'diff-changed nil
;                      :foreground "white" :background "purple"))
;(eval-after-load "diff-mode"
;  '(update-diff-colors))



;(require 'helm-ag)
;(require 'flx)
;(flx-ido-mode t)



;(fringe-mode (quote (0 . 0)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm yasnippet workgroups2 w3m use-package tangotango-theme tabbar smex session rich-minority relative-line-numbers recentf-ext projectile-speedbar pp-c-l powerline persp-projectile paradox page-break-lines org-cliplink org-caldav org-bullets multi-term monokai-theme molokai-theme moe-theme minibuffer-line markdown-mode magit linum-relative key-chord jekyll-modes irony iedit ido-vertical-mode ido-ubiquitous icicles hydra highlight-tail highlight-escape-sequences highlight-current-line helm-projectile helm-ls-svn helm-ls-git helm-gtags helm-ag google-c-style ggtags flyspell-lazy flymake-google-cpplint flymake-cursor flx-ido fiplr eyebrowse evil-leader evil-escape ecb dired+ diff-hl cyberpunk-theme company color-theme-sanityinc-tomorrow color-theme color-identifiers-mode auto-complete-c-headers ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
