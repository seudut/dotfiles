

(use-package projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alian)
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-global-mode))



(provide 'init-projectile)
