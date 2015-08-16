
(require 'helm)
(require 'helm-config)
(require 'helm-adaptive)
(helm-mode 1)

;; helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;; helm-mini
;;(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-o C-j") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; helm-find-file
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-o C-f") 'helm-find-files)



;; http://stackoverflow.com/questions/9992475/how-to-show-anything-buffers-always-in-new-window
(setq helm-display-function
      (lambda (buf)
        (split-window-vertically)
        (other-window 1)
        (switch-to-buffer buf)))


;;;;;;; http://tuhdo.github.io/helm-intro.html
;;;;;(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;;;;      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;;;;      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;;;;      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;;;;      helm-ff-file-name-history-use-recentf t)



(helm-autoresize-mode 1)
(helm-adaptive-mode 1)
(helm-adaptative-mode 1)
(setq helm-adaptive-history 1)

(provide 'init-helm)
