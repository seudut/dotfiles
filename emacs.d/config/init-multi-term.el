

;; http://rawsyntax.com/blog/learn-emacs-zsh-and-multi-term/
;; color display
;; tic -o ~/.terminfo /usr/local/Cellar/emacs/24.5/share/emacs/24.5/etc/e/eterm-color.ti

(require 'multi-term)

(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

(add-hook 'term-mode-hook
          (lambda ()
	    (linum-mode -1)
	    (highlight-current-line-on nil)))


(add-to-list 'term-bind-key-alist '("C-c C-n" . multi-term-next))
(add-to-list 'term-bind-key-alist '("C-c C-p" . multi-term-prev))
(add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))

(provide 'init-multi-term)
