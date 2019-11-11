;;; utilities.el --- Some utility functions          -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Peng Li

;; Author: Peng Li <seudut@gmail.com>
;; Keywords: lisp

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

;; These are some utility functions 

;;; Code:

(defun sd/eshell-clear-buffer ()
  "Clear eshell buffer"
  (interactive)
  (let ((inhibit-read-only t)
	(current-point (- (point-max) (point))))
    (beginning-of-line)
    (delete-region (point-min) (point))
    (goto-char (- (point-max) current-point))))

(defun sd/delete-current-window ()
  (interactive)
  (if (> (length (window-list)) 1)
      (delete-window)
    (message "Only one Windows now!")))


(defun sd/toggle-max-windows ()
  "Set maximize current if there are multiple windows, if only
one window, window undo"
  (interactive)
  (if (equal  (length (window-list)) 1)
      (winner-undo)
    (delete-other-windows)))


(defun sd/kill-region-or-backward-kill-word ()
  "Delete the region if it exists, otherwise kill a word backward."
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word 1)))

;; https://www.emacswiki.org/emacs/TransparentEmacs
(defun sd/transparency (value)
  "Sets the transparency of the frame window with a value from 0 to 100."
  (interactive "nTransparency Value 0 - 100 opague:(default 80) ")
  (set-frame-parameter (select-frame) 'alpha value))

(defun sd/toggle-transparency ()
  "Enable or disable transparency"
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha
			 (if (eql alpha 80)
			     100
			   80))))

(defun my-open-scratch-in-project  ()
  "Create or open scratch buffer under currrent project."
  (interactive)
  (let (ret)
    (dolist (buf (projectile-project-buffers) ret)
      (if (string-match "*scratch*" (buffer-name buf))
	  (setq ret buf)))
    (if ret
	(switch-to-buffer ret)
      (switch-to-buffer (format "*scratch*<%s>" (projectile-project-name)))
      (funcall initial-major-mode)
      (insert (format ";; %s under  %s project\n\n" (buffer-name) (projectile-project-name))))))

(provide 'utilities)
;;; utilities.el ends here
