;; ;;; shell-command-output-mode.el --- A major mode for shell command output buffer  -*- lexical-binding: t; -*-

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

;; Nothing

;;; Code:

(defvar shell-command-output-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "q") (lambda () (interactive) (quit-window t)))
    map)
  "Keymap used in shell-command-output-mode mode")

(defcustom shell-command-output-mode-hook nil
  "Hook run when shell command output mode is enabled"
  :type 'hook
  :group 'shell-command-outut)

;;;###autoload
(define-derived-mode shell-command-output-mode fundamental-mode "shell-command-output" ""
  (use-local-map shell-command-output-mode-map)
  (setq buffer-read-only t)
  ;; enable evil motion state for this mode
  (if (and (boundp evil-mode) (fboundp 'evil-motion-state))
      (progn (add-to-list 'evil-motion-state-modes 'shell-command-output-mode)
	     (evil-motion-state))))

(provide 'shell-command-output-mode)
;;; shell-command-output-mode.el ends here
