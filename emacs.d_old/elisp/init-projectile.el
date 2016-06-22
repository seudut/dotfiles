

;; http://batsov.com/projectile/
;; Todo add svn repo support

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
  (helm-projectile-on)
  :bind (("s-f" . helm-projectile-find-file)
	 ("s-b" . helm-projectile-switch-to-buffer)))

(use-package perspective
  :ensure t
  :config
  (persp-mode))

(use-package persp-projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-persp-switch-project))


(provide 'init-projectile)
