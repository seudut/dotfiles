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
;;   Left - workspace list
;;   Right - Showing Time
;;   Center - buffer , as no windows in its left or right.
;;   -----------------------------
;;   |>>>         O           <<<| 
;;   -----------------------------
;; type = 2.
;;   -----------------------------
;;   |>>>                       O| 
;;   -----------------------------
;; type = 3.
;;   -----------------------------
;;   |O                       <<<| 
;;   -----------------------------
;; type = 4.
;;   -----------------------------
;;   |            O              | 
;;   -----------------------------
;; type = 5.
;;   -----------------------------
;;   |                          O| 
;;   -----------------------------
;; type = 6.
;;   -----------------------------
;;   |O                          | 
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

(defface my-powerline-hl-ws '((t (:background "blue" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)

(defface my-powerline-ws-bg '((t (:background "blue" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)


(defface my-evil-mode-tag '((t (:foreground "black" :inherit mode-line)))
  "My evil mode line"
  :group 'powerline)

(defface my-powerline-evil-normal '((t (:background "green" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)

(defface my-powerline-evil-emacs '((t (:background "red" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)

(defface my-powerline-evil-insert '((t (:background "orange" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)

(defface my-powerline-evil-visual '((t (:background "orange" :foreground "black" :inherit mode-line)))
  "My Powerline face 1 based on powerline-active1."
  :group 'powerline)

(defun my-get-ws-name-list ()
  "Return the name list of workspaces gotten from `perspeen-modestring' without the properties."
  (split-string (substring-no-properties (cadr perspeen-modestring)) "|"))

(defun my-get-selected-ws-name ()
  (let ((ret))
    (dolist (i (split-string (cadr perspeen-modestring) "|") ret)
      (if (equal (car (text-properties-at 1 i))
		 'face)
	  (setq ret (substring-no-properties i))))))


(defun my-build-left-below-mode-line (separator lface face1)
  (let ((l)
	(selected-name (my-get-selected-ws-name))
	(name-list (my-get-ws-name-list)))
    (if (string= selected-name (car name-list))
	(progn
	  (setq l (list (funcall separator lface 'my-powerline-hl-ws)
	  		(powerline-raw (car name-list) 'my-powerline-hl-ws)
	  		(funcall separator 'my-powerline-hl-ws face1)))
	  (dolist (i (cdr name-list))
	    (nconc l (list (powerline-raw i face1)
			   (funcall separator face1 face1)))))
      (setq l (list (funcall separator lface face1)))
      (while name-list
	(let ((current-selected (string= selected-name (car name-list)))
	      (next-selected (string= selected-name (cadr name-list))))
	  (nconc l (list (powerline-raw (car name-list) (if current-selected 'my-powerline-hl-ws face1))
			 (funcall separator (if current-selected 'my-powerline-hl-ws face1) (if next-selected 'my-powerline-hl-ws face1)))))
	(pop name-list)))
    l))

(defun my-is-special-buffer ()
  ;; suppose all buffer name started with a star is a special buffer.
  (string-match "\*" (buffer-name)))

(defun my-get-buffer-name-face (orignal-face)
  (cond
   ((not (powerline-selected-window-active)) orignal-face)
   (buffer-read-only 
    'sd/buffer-view-active1)
   ((and (buffer-modified-p) (not (my-is-special-buffer)))
    'sd/buffer-modified-active1)
   (t orignal-face)))

(defun get-active-window-evil-tag ()
  (dolist (i (window-list) ret)
    (with-selected-window i
      (when (powerline-selected-window-active)
	(setq ret (with-current-buffer (window-buffer)
		    evil-mode-line-tag))))))

(defun sd/powerline-center-theme_revised-2 ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((window-type (my-get-window-type))
			  (active (powerline-selected-window-active))
			  (my-face1 'sd/powerline-active1 )
                          (face1 'powerline-active1)
			  ;; (face1 'mode-line-inactive)
                          (face2 'powerline-active2)
                          (separator-left (intern (format "powerline-%s-%s" (powerline-current-separator) (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s" (powerline-current-separator) (cdr powerline-default-separator-dir))))
			  (lface (if (and (not active) (or (= window-type 3) (= window-type 6))) face2 my-face1))
			  (cface (if active my-face1 face2))
			  (rface (if (and (not active) (or (= window-type 2) (= window-type 5))) face2 my-face1))
                          (lhs (cond ((or (= window-type 1) (= window-type 2))
				      (append (list (powerline-raw (when evil-mode (get-active-window-evil-tag)) 'my-powerline-evil-normal)
						    (powerline-raw " WS " lface))
					      (append
					       (my-build-left-below-mode-line separator-left lface face1))))
				     ((or (= window-type 3) (= window-type 6))
				      (list (powerline-buffer-id (my-get-buffer-name-face lface) 'l)
					    (unless (my-is-special-buffer)
					      (powerline-raw "%* " (my-get-buffer-name-face lface)))
					    (funcall separator-left (my-get-buffer-name-face lface) face1 )))
				     (t
				      nil)))
                          (center (cond ((or (= window-type 1) (= window-type 4))
					 (list (powerline-raw " " face1)
					       (funcall separator-right face1 (my-get-buffer-name-face cface))
					       (unless (my-is-special-buffer)
						 (powerline-raw "%*" (my-get-buffer-name-face cface)))
					       (powerline-buffer-id (my-get-buffer-name-face cface) 'r)
					       (funcall separator-left (my-get-buffer-name-face cface) face1)))
					(t
					 nil)))
			  (rhs (cond ((or (= window-type 1) (= window-type 3))
				      (list (powerline-raw (format-time-string "%Y-%m-%d %a") face1 'r)
					    (funcall separator-right face1 rface)
					    (powerline-raw (format-time-string " %I:%M %p ") rface 'r)))
			       	     ((or (= window-type 2) (= window-type 5))
			       	      (list (funcall separator-right face1 (my-get-buffer-name-face rface))
					    (unless (my-is-special-buffer)
					      (powerline-raw "%*" (my-get-buffer-name-face rface)))
			       		    (powerline-buffer-id (my-get-buffer-name-face rface) 'r)
			       		    (powerline-raw " " (my-get-buffer-name-face rface))))
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
  
   
