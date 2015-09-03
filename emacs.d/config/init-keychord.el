

(require 'key-chord)

(setq key-chord-two-keys-delay 0.5)

;; from emacs conference 2015 workshop
(defun keychord-keymap (keychord bindings)
  (setq keymap (make-sparse-keymap))
  (dolist (binding bindings)
    (define-key keymap (car binding) (cdr binding)))
  (key-chord-define-global keychord keymap))

;; main keymap
(keychord-keymap "dk"
                 '(("f" . helm-mini)
                   ("a" . find-file)))


;; helm-mini find buffer and recent file 
(key-chord-define-global "sj" 'helm-mini)
(key-chord-define-global "sk" 'helm-find-files)
;(key-chord-define-global ";s" ')

(key-chord-define-global "jj" "\C-g")
(key-chord-mode 1)

(provide 'init-keychord)
