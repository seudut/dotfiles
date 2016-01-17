

;; http://batsov.com/projectile/

(use-package projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alian)
  (setq projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-global-mode))


(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match nil)
  :config
  (helm-projectile-on))

(use-package perspective
  :ensure t
  :config
  (persp-mode))

(use-package persp-projectile
  :ensure t
  :defer t)


;; (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)


(provide 'init-projectile)
