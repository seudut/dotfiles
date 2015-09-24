(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "1bc544f0a4569648d0e50436801e01f4698a6c4c")
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
 '(powerline-height 14)
 '(powerline-text-scale-factor 0.85))
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
