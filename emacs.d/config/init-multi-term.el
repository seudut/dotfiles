

;; http://rawsyntax.com/blog/learn-emacs-zsh-and-multi-term/
;; color display
;; tic -o ~/.terminfo /usr/local/Cellar/emacs/24.5/share/emacs/24.5/etc/e/eterm-color.ti

(require 'multi-term)

(setq multi-term-program "/bin/zsh")


(add-hook 'term-mode-hook
          (lambda ()
	    (linum-mode nil)))

(provide 'init-multi-term)
