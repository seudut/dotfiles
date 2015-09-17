


(require 'projectile)
(require 'projectile-speedbar)


(projectile-global-mode)

(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)

;; with helm
(require 'helm-projectile)
(helm-projectile-on)


;(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'projectile-dired)

;; with - perspective
(persp-mode)
(require 'persp-projectile)

(provide 'init-projectile)















