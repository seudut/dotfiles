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





(provide 'utilities)
;;; utilities.el ends here
