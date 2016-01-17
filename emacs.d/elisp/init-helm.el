

;; helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffer-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-cadidate-number-limit 20)
  (setq helm-display-function
      (lambda (buf)
        (split-window-vertically)
        (other-window 1)
        (switch-to-buffer buf)))
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :bind (("M-x" . helm-M-x)))



(provide 'init-helm)
