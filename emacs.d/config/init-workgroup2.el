
(require 'workgroups2)


(setq wg-prefix-key (kbd "C-c z"))
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")
;(workgroups-mode 1)

(provide 'init-workgroup2)
