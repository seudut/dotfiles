
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

(provide 'init-ggtags)
