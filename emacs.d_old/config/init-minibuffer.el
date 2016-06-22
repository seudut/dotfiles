


;;; set font size of minibuffer
;;;; http://stackoverflow.com/questions/7869429/altering-the-font-size-for-the-emacs-minibuffer-separately-from-default-emacs
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
       (set (make-local-variable 'face-remapping-alist)
          '((default :height 120))))



(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:background "green")))))

(provide 'init-minibuffer)
