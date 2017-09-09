;;; my-mode-line.el --- my mode line based on powerline  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Peng Li

;; Author: Peng Li <seudut@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; test

;;; Code:

;; A windows may have six kinds different mode-line
;; type = 1.
;;   -----------------------------
;;   |>>>         O           <<<| 
;;   -----------------------------

(defun my-below-winow-has-effect-window ()
  "Return true when its below has no active window or
its below window is minibuffer window. "
  (let ((window (window-in-direction 'below nil nil 1)))
    (and window
	 (not (window-minibuffer-p window)))))

(defun my-get-window-type ()
  "According to the window layout, separate the windows as six types.
Each type will have different mode line. This function return the defined
window type."
  (cond ((and (not (window-in-direction 'right nil nil -1))
	      (not (window-in-direction 'left nil nil -1))
	      (not (my-below-winow-has-effect-window)))
	 1)
	((and (window-in-direction 'right nil t -1)
	      (not (window-in-direction 'left nil nil -1))
	      (not (my-below-winow-has-effect-window)))
	 2)
	((and (not (window-in-direction 'right nil nil -1))
	      (window-in-direction 'left nil nil -1)
	      (not (my-below-winow-has-effect-window)))
	 3)
	((and (window-in-direction 'right nil nil -1)
	      (not (window-in-direction 'left nil nil -1))
	      (my-below-winow-has-effect-window))
	 5)
	((and (not (window-in-direction 'right nil nil -1))
	      (window-in-direction 'left nil nil -1)
	      (my-below-winow-has-effect-window))
	 6)
	(t
	 4)))


(defun sd/powerline-center-theme_revised-2 ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((window-type (my-get-window-type))
			  (active (powerline-selected-window-active))
			  (my-face1 'sd/powerline-active1 )
                          ;; (my-face-buffer-modified (if (and (sd/buffer-is-eshel-or-scratch) (buffer-modified-p) (not buffer-read-only)) 
                          ;;                              'sd/buffer-modified-active1
                          ;;                            (if buffer-read-only 'sd/buffer-view-active1
                          ;;                              my-face1)))
                          (face1 'powerline-active1)
                          (face2 'powerline-active2)
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
			  (lface (if (and (not active)
					  (or (= window-type 3) (= window-type 6)))
				     face2
				   my-face1))
			  (cface (if active my-face1 face2))
			  (rface (if (and (not active)
					  (or (= window-type 2) (= window-type 5)))
				     face2
				   my-face1))
                          (lhs (cond ((or (= window-type 1) (= window-type 2))
				      (list (powerline-raw " = ws1 = " lface)
					    (funcall separator-left lface face1 )))
				     ((or (= window-type 3) (= window-type 6))
				      (list (powerline-buffer-id lface 'l)
					    (powerline-raw "%* " lface)
					    (funcall separator-left lface face1 )))
				     (t
				      nil)))
                          (center (if (or (= window-type 1) (= window-type 4))
				      (list (powerline-raw " " face1)
					    (funcall separator-right face1 cface)
					    (powerline-raw "%*" cface)
					    (powerline-buffer-id cface 'r)
					    (funcall separator-left cface face1))
				    nil))
			  (rhs (cond ((or (= window-type 1) (= window-type 3))
				      (list (funcall separator-right face1 rface)
					    (powerline-raw (format-time-string " %I:%M %p ") rface 'r)))
				     ((or (= window-type 2) (= window-type 5))
				      (list (funcall separator-right face1 rface)
					    (powerline-raw "%*" rface)
					    (powerline-buffer-id rface 'r)
					    (powerline-raw " " rface)))
				     (t
				      nil))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))

(sd/powerline-center-theme_revised-2)

(provide 'my-mode-line)
;;; my-mode-line.el ends here
  
   
