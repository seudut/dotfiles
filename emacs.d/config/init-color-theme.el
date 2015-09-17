

;(setq display-time-day-and-date t)
;(display-time-mode t)


(setq ns-use-srgb-colorspace nil)

(require 'color-theme)

(load-theme 'cyberpunk t)

(require 'evil)
(require 'powerline)
;(require 'powerline-evil)



;(set-face-attribute 'mode-line nil :font "Source Code Pro for Powerline-10")

;;; this variable should equal as height in mode-line
(custom-set-variables
 '(powerline-height 14)
 '(powerline-text-scale-factor 0.85)) ;; 100/140

(custom-set-faces
;;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil :height 0.8 ))))
;;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil :height 0.8)))))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil  :family "Source Code Pro for Powerline" :height 100))))
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil  :family "Source Code Pro for Powerline" :height 80))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil :family "Source Code Pro for Powerline" :height 100)))))

(defface powerline-active00 '((t (:foreground "#030303" :background "#bdbdbd" :box nil :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive00 '((t (:foreground "#f9f9f9" :background "#666666" :box nil :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active11 '((t (:background "grey22" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active22 '((t (:background "grey40" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive11   '((t (:background "grey11" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive22   '((t (:background "grey20" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)


;(defface powerline-active-yel '((t (:background "yellow" :inherit mode-line)))
(defface powerline-active-yel '((t (:background "yellow" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active-blue '((t (:background "blue" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

;;;---------------- evil powerline
; https://github.com/raugturi/powerline-evil/blob/master/powerline-evil.el
; ;https://github.com/laynor/emacs-conf/blob/master/packages/sm-package-powerline.el
;(defface powerline-evil-base-face '((t (:foreground "white" :inherit mode-line)))
;(defface powerline-evil-base-face '((t (:foreground "black" :weight bold )))
(defface powerline-evil-base-face '((t (:foreground "black" :weight bold :inherit mode-line)))
  "Base face for powerline evil faces."
  :group 'powerline)

(defface powerline-evil-normal-face '((t (:background "green" :inherit powerline-evil-base-face)))
  "Powerline face for evil NORMAL state."
  :group 'powerline)

(defface powerline-evil-insert-face '((t (:background "blue" :inherit powerline-evil-base-face)))
  "Powerline face for evil INSERT state."
  :group 'powerline)

(defface powerline-evil-visual-face '((t (:background "orange" :inherit powerline-evil-base-face)))
  "Powerline face for evil VISUAL state."
  :group 'powerline)

(defface powerline-evil-operator-face   '((t (:background "cyan" :inherit powerline-evil-base-face)))
  "Powerline face for evil OPERATOR state."
  :group 'powerline)

(defface powerline-evil-replace-face    '((t (:background "red" :inherit powerline-evil-base-face)))
  "Powerline face for evil REPLACE state."
  :group 'powerline)

(defface powerline-evil-motion-face '((t (:background "magenta" :inherit powerline-evil-base-face)))
  "Powerline face for evil MOTION state."
  :group 'powerline)

(defface powerline-evil-emacs-face  '((t (:background "violet" :inherit powerline-evil-base-face)))
  "Powerline face for evil EMACS state."
  :group 'powerline)

(defun powerline-evil-face ()
  "Function to select appropriate face based on `evil-state'."
  (let* ((face (intern (concat "powerline-evil-" (symbol-name evil-state) "-face"))))
    (if (facep face) face nil)))


  (defun powerline-evil-face (active)
    (let ((face (intern (concat "powerline-evil-" (symbol-name evil-state) "-face"))))
      (cond ((and active (facep face))
             face)
            (active 'powerline-active22)
            (t 'powerline-inactive22))))

  (defun powerline-evil-face-22 (active)
    (if (equal (symbol-name evil-state) "normal")

        (let ((face (intern (concat "powerline-evil-emacs-face"))))
          face)

        (let ((face (intern (concat "powerline-evil-normal-face"))))
          face)

;;          (cond ((and active (facep face))
;;                 face)
;;                (active 'powerline-active22)
;;                (t 'powerline-inactive22)))

;;;;    (let ((face (intern (concat "powerline-evil-" (symbol-name evil-state) "-face"))))
;;;;      (cond ((and active (facep face))
;;;;             face)
;;;;            (active 'powerline-active22)
;;;;            (t 'powerline-inactive22)))
    )
    )



  (defpowerline powerline-evil-tag
    (concat " " (replace-regexp-in-string "[<> ]" "" (eval (evil-state-property evil-state :tag))) " "))





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

(defun powerline-evil-tag-new ()
  (concat (replace-regexp-in-string "[<>]" "" (powerline-evil-tag)) " ")
  )

;; -----------------------------------------------------------------------------

;; -----------------------------------------------------------------------------
;; |evil| buffer_name | major-mode | vc |            | position | pwd | time |
;; -----------------------------------------------------------------------------
;;
;; ToDo:
;; position and pwd only shows in some mode, such as programming mode
;; using workgroup instead of pwd
;; some other modes such as eshell, package, help, don't need the posittion and
;; pwd
;;

;; -----------------------------------------------------------------------------

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
                        (pl-evil-face (ignore-errors (powerline-evil-face active)))
                        (pppp-face
                           (intern (concat "powerline-evil-" (symbol-name evil-state) "-face")))

                        (face-yel22
                         (if active 'powerline-active-yel 'powerline-inactive22))
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
;;                                (let ((evil-face (powerline-evil-face)))
;;                                    (if evil-mode
;;                                            (powerline-raw (powerline-evil-tag) evil-face)
;;                                    )
;;
;;                                )
                                (if evil-mode
                                (powerline-raw (powerline-evil-tag) pl-evil-face))
;;;                                (and evil-mode (funcall separator-left pppp-face face-yel))
;;;;;;                                (funcall separator-left pppp-face pppp-face)
;;;;                                (powerline-raw (powerline-evil-tag) pppp-face face-yel)
;;                                (funcall separator-left (powerline-evil-face) face-yel)

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
				;;  position
;;				(powerline-raw (concat " [" (powerline-format-default-directory default-directory) "] ") mode-line)
                                (powerline-raw (format " P:[%s] " (projectile-project-name))  mode-line)
				                (funcall separator-right mode-line face-blue)
				;; pwd/workgroups
                                (powerline-raw (concat "%3c, %l/" (format "%d" (count-lines (point-min) (point-max))) " %4p ") face-blue)
;				                (funcall separator-right face-blue face1)
                                ;; date and time
;;;			                    (powerline-raw (format-time-string " %m-%d") face1 'r)
                                (funcall separator-right face-blue face-yel)
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



;;(let ((faces '(mode-line
;;               powerline-active00
;;               powerline-active11
;;               powerline-active22
;;               powerline-active-yel
;;               powerline-active-blue
;;               mode-line-buffer-id
;;               mode-line-emphasis
;;               mode-line-highlight
;;               mode-line-inactive)))
;;     (mapc
;;;      (lambda (face) (set-face-attribute face nil :font "Source Code Pro for Powerline-10"))
;;      (lambda (face) (set-face-attribute face nil :font "Courier"))
;;      faces))



(provide 'init-color-theme)



;; TODO
;; 1. change color when buffer is modified
;; 2. 
;; show date and time in the right below minibuffer

