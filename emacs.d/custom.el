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
 '(package-selected-packages
   (quote
    (org-bullets org-cliplink org-caldav yasnippet workgroups2 w3m use-package tangotango-theme tabbar smex session rich-minority relative-line-numbers recentf-ext projectile-speedbar pp-c-l powerline persp-projectile paradox page-break-lines multi-term monokai-theme molokai-theme moe-theme minibuffer-line markdown-mode magit linum-relative key-chord jekyll-modes irony iedit ido-vertical-mode ido-ubiquitous icicles hydra highlight-tail highlight-escape-sequences highlight-current-line helm-projectile helm-ls-svn helm-ls-git helm-gtags helm-ag google-c-style ggtags flyspell-lazy flymake-google-cpplint flymake-cursor flx-ido fiplr eyebrowse evil-leader evil-escape ecb dired+ diff-hl cyberpunk-theme company color-theme-sanityinc-tomorrow color-theme color-identifiers-mode auto-complete-c-headers ace-window ace-jump-mode)))
 '(powerline-text-scale-factor 0.85))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
