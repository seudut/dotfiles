


(require 'projectile)
(require 'projectile-speedbar)


(projectile-global-mode)

(setq projectile-enable-caching t)
;(setq projectile-indexing-method 'native)
(setq projectile-indexing-method 'alien)
;; with helm
(require 'helm-projectile)
(helm-projectile-on)


;(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'projectile-dired)

;; https://www.reddit.com/r/emacs/comments/2pvmkm/helm_projectile_now_enables_fuzzy_matching_by/
(setq helm-projectile-fuzzy-match nil)

;; with - perspective
(persp-mode)
(require 'persp-projectile)

(provide 'init-projectile)















