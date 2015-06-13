

;(setq display-time-day-and-date t)
;(display-time-mode t)


(setq ns-use-srgb-colorspace nil)

(require 'color-theme)

(load-theme 'cyberpunk t)

(require 'evil)
(require 'powerline)
(require 'powerline-evil)



;;; this variable should equal as height in mode-line
(custom-set-variables
 '(powerline-text-scale-factor 0.85))

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil :height 0.8 ))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil :height 0.8)))))


(defface powerline-active00 '((t (:foreground "#030303" :background "#bdbdbd" :box nil )))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive00 '((t (:foreground "#f9f9f9" :background "#666666" :box nil )))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active11 '((t (:background "grey22" )))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active22 '((t (:background "grey40" )))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive11
  '((t (:background "grey11" )))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive22
  '((t (:background "grey20" )))
  "Powerline face 2."
  :group 'powerline)






;(defface powerline-active-yel '((t (:background "yellow" :inherit mode-line)))
(defface powerline-active-yel '((t (:background "yellow" )))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active-blue '((t (:background "blue" )))
  "Powerline face 1."
  :group 'powerline)



;;
;;http://emacser.com/mode-line.htm
(defun get-lines-4-mode-line ()
  (let ((lines (count-lines (point-min) (point-max))))
    (concat (propertize
             (format "%d" lines)
             'mouse-face 'mode-line-highlight
             'face 'mode-line-lines-face
             'help-echo (format "%d lines" lines)) " ")))



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

(defun powerline-format-default-directory (s)
  (if s
    (replace-regexp-in-string "/Users/peli3/"  "~/" s)
    s))

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
                         (if active 'powerline-active00 'powerline-inactive00))
                        (face1
                         (if active 'powerline-active11 'powerline-inactive11))
                        (face2
                         (if active 'powerline-active22 'powerline-inactive22))
                        (face-yel
                         (if active 'powerline-active-yel 'powerline-inactive22))
                        (face-blue
                         (if active 'powerline-active-blue 'powerline-inactive22))
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
                                (let ((evil-face (powerline-evil-face)))
                                    (if evil-mode
;                                        (progn 
                                            (powerline-raw (powerline-evil-tag) evil-face)
;;                                            )
                                        )
                                    )
                                (funcall separator-left (powerline-evil-face) face-yel)

                                (powerline-raw "%*" face-yel 'l)
                                (powerline-buffer-id face-yel 'l)
                                (powerline-raw " " face-yel)
                                (funcall separator-left face-yel face-blue )
				                (powerline-raw " " face-blue)
                                (powerline-major-mode face-blue 'r)
                                (funcall separator-left face-blue mode-line)
                                (powerline-narrow mode-line 'l)
;                                (powerline-vc mode-line 'r)
                                (powerline-simpler-vc-mode (powerline-vc mode-line 'r))
                                (funcall separator-left mode-line face1)))
;                                (powerline-simpler-vc-mode (powerline-vc face2))))
			
                        (rhs
                            (list
                                (funcall separator-right face1 mode-line)
                                (powerline-raw (concat "%3c, %l/" (format "%d" (count-lines (point-min) (point-max))) " %4p ") mode-line)
				                (funcall separator-right mode-line face-blue)
				                (powerline-raw " [" face-blue)
				                (powerline-raw (powerline-format-default-directory default-directory) face-blue )
				                (powerline-raw "] " face-blue)
				                (funcall separator-right face-blue face1)
			                    (powerline-raw (format-time-string " %m-%d") face1 'r)
                                (funcall separator-right face1 face-yel)
			                    (powerline-raw (format-time-string " %I:%M %p %a ") face-yel 'r)))
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
                      (powerline-fill face1
                                      (powerline-width rhs))
                      (powerline-render rhs))
                     ); let
                   ); :eval
                  ); '(
                ); setq
  ); defun


(powerline-ha-theme)

(provide 'init-color-theme)


;; TODO
;; 1. change color when buffer is modified
;; 2. 
