
(require 'helm)
(require 'helm-config)
(require 'helm-adaptive)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
;; http://tuhdo.github.io/helm-intro.html
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; http://stackoverflow.com/questions/9992475/how-to-show-anything-buffers-always-in-new-window
(setq helm-display-function
      (lambda (buf)
        (split-window-vertically)
        (other-window 1)
        (switch-to-buffer buf)))


(helm-autoresize-mode 1)
(helm-adaptive-mode 1)
(helm-adaptative-mode 1)
(setq helm-adaptive-history 1)

(provide 'init-helm)
