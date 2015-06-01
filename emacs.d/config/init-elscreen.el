;; this config file is based on  seudut/elscreen.git, which added two interface and one property 
;; default directory

(elscreen-set-default-directory (elscreen-get-current-screen) "~/")


;; tab face

(custom-set-faces
 '(elscreen-tab-current-screen-face ((t (:background "Yellow" :foreground "black"))))
 '(elscreen-tab-other-screen-face ((t (:background "gray22" :foreground "black")))))

;;(add-hook 'elscreen-create-hook
;;          (lambda ()
;;            (elscreen-set-default-directory  
;;              (elscreen-get-current-screen) "~/")))


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

(defun sd-update-elscreen-dir ()
  "update elscreen dir as current default directory"
  (interactive)
  (elscreen-set-default-directory (elscreen-get-current-screen) default-directory))




;;(add-hook 'buffer-list-update-hook
;;          (lambda ()
;;            (let ((el-dir (elscreen-get-default-directory (elscreen-get-current-screen))))
;;              (if (> (length el-dir) 0)
;;                 (cd el-dir)))))

(defvar elscreen-exclude-modes '(eshell-mode magit magit-status-mode magit-commit-mode magit-diff-mode) "the major modes don't update directory")

;; when major-mode is magit-*, don't change default-directory, otherwise, there is error when usingit command in magin-* mode
(add-hook 'elscreen-screen-update-hook
          (lambda ()
            (let ((el-dir (elscreen-get-default-directory (elscreen-get-current-screen))))
	      (unless (member  major-mode elscreen-exclude-modes)
                (if (> (length el-dir) 0)
                  (cd el-dir))))))


(provide 'init-elscreen)
