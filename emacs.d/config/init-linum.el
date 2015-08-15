;; refer to https://github.com/aaronbieber/dotfiles/blob/master/configs/emacs.d/lisp/init-linum.el
;; Stuff for line numbers.


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "gray22"))))
 '(linum ((t (:background "#000000" :foreground "gray40" :height 0.8 :slant italic :weigth light))))
 '(linum-relative-current-face ((t (:inherit linum :foreground "Yellow" :weight light :height 0.8)))))

(require 'linum-relative)

(defface linum-current
;  '((t (:inherit linum :weight bold :underline "#555")))
  '((t (:inherit linum :weight bold :foreground "Yellow")))
  "The current line number.")

(defun my-linum-get-format-string ()
 (let* ((width (min 4 (1+ (length (number-to-string
                             (count-lines (point-min) (point-max)))))))
         (format (concat "%" (number-to-string width) "d "))
         (current-line-format (concat "%-" (number-to-string width) "d ")))
    (setq my-linum-format-string format)
;    (setq my-linum-current-line-format-string current-line-format)))
    (setq my-linum-current-line-format-string format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let* ((offset (abs (- line-number my-linum-current-line-number)))
         (linum-display-value (if (= 0 offset)
			   my-linum-current-line-number
                                offset))
         (format-string (if (= my-linum-current-line-number line-number) my-linum-current-line-format-string my-linum-format-string))
         (face (if (= my-linum-current-line-number line-number) 'linum-current 'linum)))
    (propertize (format format-string linum-display-value) 'face face)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

;;; Set up relative line numbering to mimic `:set number relativenumber`.
(global-linum-mode t)
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)





;; enable linum-relative in programming mode
;https://github.com/howardabrams/dot-files/blob/master/emacs.org
(add-hook 'prog-mode-hook 'linum-mode)

;; hight current line
(require 'highlight-current-line)
(highlight-current-line-on t)



(provide 'init-linum)
