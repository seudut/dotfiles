
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (linum-mode -1)
	    (highlight-current-line-on nil)))



(provide 'init-eshell)
