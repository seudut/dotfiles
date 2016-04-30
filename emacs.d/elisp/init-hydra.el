
;; key mapping 
;; TODO:
;;    1. exec external progeam
;;       prefix + s : eshell / term
;;       prefix + p : package install
;;       prefix +
;;    2. prefix for magit
;;
;;    3. prefix for avy motion
;;    4. window / buffer switch
;;    5. file project switch
(use-package hydra
  :ensure t
  :config
  (hydra-add-font-lock))


(defhydra hydra-external (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  )


;; hydra for Misc commands
(defhydra hydra-misc (:exit t)
  "Misc Commands" 
  ("e" eshell "eshell" :color red)
  ("p" (lambda ()
	 (interactive)
	 (if (pl/buffer-exist "*Packages*")
	     (switch-to-buffer "*Packages*")
	   (package-list-packages)))
   "List-package" :color red)
  )
(defun pl/buffer-exist (bufname) (not (eq nil (get-buffer bufname))))
(global-set-key (kbd "<f3>") 'hydra-misc/body)







(provide 'init-hydra)
