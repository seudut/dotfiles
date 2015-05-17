

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
;(powerline-default-theme)


;(defconst color1 "#6b8e23")
;(defconst color2 "#eedd82")

;(make-face 'mode-line-color-1)
;(set-face-attribute 'mode-line-color-1 nil
;                    :foreground "#fffacd"
;                    :bold t
;                    :background color1)

;(make-face 'mode-line-color-2)
;(set-face-attribute 'mode-line-color-2 nil
;                    :foreground "#fffacd"
;                    :bold t
;                    :background color2)


;;(defface powerline-active2 '((t (:background "grey40" :inherit mode-line)))
;;  "Powerline face 2."
;;  :group 'powerline)
;;


;; https://github.com/howardabrams/dot-files/blob/master/emacs-mode-line.org
;;;(custom-set-faces
;;; '(mode-line-buffer-id ((t (:foreground "#008000" :bold t))))
;;; '(which-func ((t (:foreground "#008000"))))
;;; '(mode-line ((t (:foreground "#008000" :background "#dddddd" :box nil))))
;;; '(mode-line-inactive ((t (:foreground "#008000" :background "#bbbbbb" :box nil)))))

;;; this variable should equal as height in mode-line
(custom-set-variables
 '(powerline-text-scale-factor 0.8))

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil :height 0.8 ))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil :height 0.8)))))


(defface powerline-active-yel '((t (:background "yellow" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active-blue '((t (:background "blue" :inherit mode-line)))
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
                        (face3
                         (if active 'powerline-active-yel 'powerline-inactive2))
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
                                (powerline-buffer-id nil 'l)
                                (powerline-raw " ")
                                (funcall separator-left mode-line face1)
                                (powerline-narrow face1 'l)
                                (powerline-simpler-vc-mode (powerline-vc face1))))
			
                        (rhs
                            (list
                                (funcall separator-right face1 mode-line)
			                    (powerline-raw (format-time-string " %Y-%m-%d %I:%M %p %a") nil 'r)
                                (funcall separator-right mode-line face1)
                                (powerline-raw (concat "%3c, %l/" (format "%d" (count-lines (point-min) (point-max)))) face1 'r)
                                (funcall separator-right face1 face3)
                                (powerline-raw " %4p" face3 'r)))
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
;                      (powerline-fill-center face1
;                                             (/
;                                              (powerline-width center)
;                                              2.0))
;                      (powerline-render center)
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



;                               (powerline-raw mode-line-misc-info face1 'r)
;                                (powerline-raw global-mode-string face1 'r)

;;			                    (powerline-raw '(:eval (propertize (format-time-string " %Y-%m-%d %I:%M %p %a")
;;							        'help-echo
;;							        (concat (format-time-string "%c; ")
;;								        (emacs-uptime "Uptime:%hh")))) nil)
