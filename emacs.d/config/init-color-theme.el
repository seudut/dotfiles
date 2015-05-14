
;(load-theme 'tango-dark)



(require 'moe-theme)
(moe-dark)

(require 'powerline)
(powerline-default-theme)



;(require 'color-theme)
;(load-theme 'sanityinc-tomorrow-bright t)

;(require 'moe-theme)
;(moe-dark)

;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;(require 'powerline)
;(powerline-default-theme)
;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts

;(require 'smart-mode-line)
;; These two lines are just examples
;(setq powerline-arrow-shape 'curve)
;(setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
;(setq sml/theme 'powerline)
;(sml/setup)
;(if after-init-time (sml/setup)
;  (add-hook 'after-init-hook 'sml/setup))


;;---------------------------------------------------------------------------------------
;; powerline
;;

;;;;(require 'powerline)
;;;;(powerline-evil-center-color-theme)
;(powerline-evil-vim-color-theme)

(provide 'init-color-theme)
