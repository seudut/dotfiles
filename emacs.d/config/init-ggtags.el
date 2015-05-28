
;;;; show default directory on mode-line
(ggtags-mode 1)

;; using ido-completion for ggtags
;; https://github.com/leoliu/ggtags/issues/56
(setq ggtags-completing-read-function
      (lambda (&rest args)
        (apply #'ido-completing-read
               (car args)
               (all-completions "" ggtags-completion-table)
               (cddr args))))

(custom-set-variables
 '(ggtags-split-window-function (quote split-window-vertically)))


(setq-local imenu-create-index-function #'ggtags-build-imenu-index)


; gnu global support
(require 'semantic/db)
(global-semanticdb-minor-mode 1)

(provide 'init-ggtags)
