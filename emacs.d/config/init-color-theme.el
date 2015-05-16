
(require 'color-theme)
;(load-theme 'tango-dark)
;(require 'moe-theme)
;(moe-dark)

(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme-tangotango")
(load-theme 'tangotango t)


;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(powerline-default-theme)




(provide 'init-color-theme)
