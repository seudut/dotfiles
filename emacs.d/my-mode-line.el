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

(defun my-get-window-type ()
  "According to the window layout, separate the windows as six types.
Each type will have different mode line. This function return the defined
window type."
  (if
      (and
       (not (window-in-direction 'right nil t -1))
       (not (window-in-direction 'left nil t -1))
       (not (window-in-direction 'below nil t 1)))
      1
    (if
	(and
	 (window-in-direction 'right nil t -1)
	 (not (window-in-direction 'left nil t -1))
	 (not (window-in-direction 'below nil t 1)))
	2
      (if
	  (and
	   (not (window-in-direction 'right nil t -1))
	   (window-in-direction 'left nil t -1)
	   (not (window-in-direction 'below nil t 1)))
	  3
	(if
	    (and
	     (window-in-direction 'right nil t -1)
	     (not (window-in-direction 'left nil t -1))
	     (window-in-direction 'below nil t 1))
	    5
	  (if
	      (and
	       (not (window-in-direction 'right nil t -1))
	       (window-in-direction 'left nil t -1)
	       (window-in-direction 'below ni t 1))
	      6
	    4))))))

;(my-get-window-type)


(defun sd/powerline-center-theme_revised-2 ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((window-type (my-get-window-type))
			  ;; (active (powerline-selected-window-active))
			  (active t)
                          ;; (mode-line-buffer-id (if active 'sd/mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line-buffer-id (if active 'sd/mode-line-buffer-id 'powerline-inactive1))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (my-face1 (if active 'sd/powerline-active1 'powerline-inactive1))
                          (my-face-buffer-modified (if (and (sd/buffer-is-eshel-or-scratch) (buffer-modified-p) (not buffer-read-only)) 
                                                       'sd/buffer-modified-active1
                                                     (if buffer-read-only 'sd/buffer-view-active1
                                                       my-face1)))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (if (or (= window-type 1) (= window-type 2) (= window-type 3) (= window-type 5))
				   (list (powerline-raw "%* " my-face-buffer-modified 'l)
					 (powerline-raw " " my-face1)
					 (funcall separator-left my-face1 face1)
					 (powerline-narrow face1 'l)
					 (sd/powerline-simpler-vc (powerline-vc face1)))
				 nil))
                          (center (if (or (= window-type 1) (= window-type 4))
				      (list (powerline-raw " " face1)
					    (funcall separator-right face1 face2)
					    (powerline-raw (concat " ==" (number-to-string (my-get-window-type)) "== ") face2)
					    (funcall separator-left face2 face1))
				    nil))
                          (rhs (if (or (= window-type 1) (= window-type 3) (= window-type 2) (= window-type 6))
				   (list (powerline-raw (format-time-string " %I:%M %p  ") my-face1 'r))
				 nil)))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))

(sd/powerline-center-theme_revised-2)

(provide 'my-mode-line)
;;; my-mode-line.el ends here
