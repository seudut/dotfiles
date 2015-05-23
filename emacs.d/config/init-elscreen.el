
;;(add-hook 'elscreen-create-hook
;;          (lambda ()
;;            (elscreen-set-default-directory  (elscreen-get-current-screen) "~/CPVE/")))
;;;            (elscreen-cd-default-directory "~/"))
;;

(add-hook 'elscreen-goto-hook
          (lambda ()
            (elscreen-cd-default-directory
              (elscreen-get-default-directory (elscreen-get-current-screen)))))

(defun sd-cd-dd (dir)
  "Set default directory screen."
  (interactive "sSet dir:")
  (elscreen-set-default-directory (elscreen-get-current-screen) dir)
  (cd dir)
)

(defun sd-show-dir ()
  "show elscreen default directory."
  (interactive)
  (message
  (elscreen-get-default-directory (elscreen-get-current-screen))))



(add-hook 'buffer-list-update-hook
          (lambda ()
            (let ((el-dir (elscreen-get-default-directory (elscreen-get-current-screen))))
              (if (> (length el-dir) 0)
                 (cd el-dir)))))


(provide 'init-elscreen)
