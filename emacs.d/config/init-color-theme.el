

;(setq display-time-day-and-date t)
;(display-time-mode t)


(setq ns-use-srgb-colorspace nil)

(require 'color-theme)
;(load-theme 'tango-dark)
;(require 'moe-theme)
;(moe-dark)


;(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme-tangotango")
;(load-theme 'tangotango t)
(load-theme 'cyberpunk t)

;(require 'color-theme-sanityinc-tomorrow)
;(color-theme-sanityinc-tomorrow-bright)



;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(powerline-default-theme)






;; https://github.com/howardabrams/dot-files/blob/master/emacs-mode-line.org
(custom-set-faces
 '(mode-line-buffer-id ((t (:foreground "#008000" :bold t))))
 '(which-func ((t (:foreground "#008000"))))
 '(mode-line ((t (:foreground "#008000" :background "#dddddd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#008000" :background "#bbbbbb" :box nil)))))


(defun powerline-simpler-vc-mode (s)
  (if s
      (replace-regexp-in-string "Git:" "" s)
    s))

(defun powerline-simpler-minor-display (s)
  (replace-regexp-in-string
   (concat " "
           (mapconcat 'identity '("Undo-Tree" "GitGutter" "Projectile"
                                  "Abbrev" "ColorIds" "MRev" "ElDoc" "Paredit"
                                  "+1" "+2" "FlyC" "Fly" ;; ":1/0"
                                  "Fill" "AC" "FIC") "\\|")) "" s))

(defun powerline-ha-theme ()
  "A powerline theme that removes many minor-modes that don't serve much purpose on the mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let*
                       ((active
                         (powerline-selected-window-active))
                        (mode-line
                         (if active 'mode-line 'mode-line-inactive))
                        (face1
                         (if active 'powerline-active1 'powerline-inactive1))
                        (face2
                         (if active 'powerline-active2 'powerline-inactive2))
                        (separator-left
                         (intern
                          (format "powerline-%s-%s" powerline-default-separator
                                  (car powerline-default-separator-dir))))
                        (separator-right
                         (intern
                          (format "powerline-%s-%s" powerline-default-separator
                                  (cdr powerline-default-separator-dir))))
                        (lhs
                         (list
                          (powerline-raw "%*" nil 'l)
                          ;; (powerline-buffer-size nil 'l)
                          (powerline-buffer-id nil 'l)
                          (powerline-raw " ")
                          (funcall separator-left mode-line face1)
                          (powerline-narrow face1 'l)
                          (powerline-simpler-vc-mode (powerline-vc face1))
			  ))
			
                        (rhs
                         (list
;                          (powerline-raw mode-line-misc-info face1 'r)
                          (powerline-raw global-mode-string face1 'r)
                          (funcall separator-right face1 mode-line)
			  (powerline-raw '(:eval (propertize (format-time-string " %Y-%m-%d %I:%M %p %a")
							     'help-echo
							     (concat (format-time-string "%c; ")
								     (emacs-uptime "Uptime:%hh")))) nil)
					 
			  (powerline-raw "%3c" nil)
                          (powerline-raw "," nil 'r)
                          (powerline-raw "%l" nil )
                          (powerline-raw "/" nil )
                          (powerline-raw '(:eval (get-lines-4-mode-line)) nil 'r)
                          (powerline-raw " ")
                          (powerline-raw "%4p" nil)
;			  (powerline-raw " ")
			  ))
                        (center
                         (list
                          (powerline-raw " " face1)
                          (funcall separator-left face1 face2)
                          (when
                              (boundp 'erc-modified-channels-object)
                            (powerline-raw erc-modified-channels-object face2 'l))
                          (powerline-major-mode face2 'l)
                          (powerline-process face2)
                          (powerline-raw " :" face2)

                          (powerline-simpler-minor-display (powerline-minor-modes face2 'l))

                          (powerline-raw " " face2)
                          (funcall separator-right face2 face1))))
                     (concat
                      (powerline-render lhs)
                      (powerline-fill-center face1
                                             (/
                                              (powerline-width center)
                                              2.0))
                      (powerline-render center)
                      (powerline-fill face1
                                      (powerline-width rhs))
                      (powerline-render rhs)))))))

;;http://emacser.com/mode-line.htm
(defun get-lines-4-mode-line ()
  (let ((lines (count-lines (point-min) (point-max))))
    (concat (propertize
             (format "%d" lines)
             'mouse-face 'mode-line-highlight
             'face 'mode-line-lines-face
             'help-echo (format "%d lines" lines)) " ")))
 


(powerline-ha-theme)




(provide 'init-color-theme)
