
(require 'hydra)

;; misc operation for toggle some style
;; such as toggle line number
;; windows layout restore / maximum
;; 

;; misc such as
;; package-list-p, eval-buffer

(defhydra hydra-helm (global-map "M-c")
  "Helm"
  ("j" helm-mini "helm-mini")
  ("q" nil "quit"))
;;* Examples
;;** Example 1: text scale

  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))


(global-set-key
 (kbd "C-M-o")
; (kbd "M-p")
      (defhydra hydra-window ()
	"window"
	("h" windmove-left)
	("j" windmove-down)
	("l" windmove-right)
	("k" windmove-up)
	("v" (lambda ()
	       (interactive)
	       (split-window-right)
	       (windmove-right))
	 "vert")
	("x" (lambda ()
	       (interactive)
	       (split-window-below)
	       (windmove-down))
	 "horz")
	("o" delete-other-windows "one" :color blue)
	("a" ace-window "ace")
	("s" ace-swap-window "swap")
	("d" ace-delete-window "del")
	("i" ace-maximize-window "ace-one" :color blue)
	("b" ido-switch-buffer "buf")
	("u" (progn (winner-undo) (setq this-command 'winner-undo)) "undo")
	("i" winner-undo "undo2")
	("q" nil "cancel")))

;; define C-space start mark 


;;** Example 2: move window splitter

  (defhydra hydra-splitter (global-map "C-M-s")
    "splitter"
    ("h" hydra-move-splitter-left)
    ("j" hydra-move-splitter-down)
    ("k" hydra-move-splitter-up)
    ("l" hydra-move-splitter-right))

;;** Example 3: jump to error

  (defhydra hydra-error (global-map "M-g")
    "goto-error"
    ("h" first-error "first")
    ("j" next-error "next")
    ("k" previous-error "prev")
    ("v" recenter-top-bottom "recenter")
    ("q" nil "quit"))



;;** Example 4: toggle rarely used modes

;  (defvar whitespace-mode nil)
;  (global-set-key
;   (kbd "C-c C-v")
;   (defhydra hydra-toggle-simple (:color blue)
;     "toggle"
;     ("a" abbrev-mode "abbrev")
;     ("d" toggle-debug-on-error "debug")
;     ("f" auto-fill-mode "fill")
;     ("t" toggle-truncate-lines "truncate")
;     ("w" whitespace-mode "whitespace")
;     ("q" nil "cancel")))



;;** Example 5: mini-vi
(defun hydra-vi/pre ()
  (set-cursor-color "#e52b50"))

(defun hydra-vi/post ()
  (set-cursor-color "#ffffff"))


  (global-set-key
   (kbd "C-z")
   (defhydra hydra-vi (:pre hydra-vi/pre :post hydra-vi/post :color amaranth)
     "vi"
     ("l" forward-char)
     ("h" backward-char)
     ("j" next-line)
     ("k" previous-line)
     ("m" set-mark-command "mark")
     ("a" move-beginning-of-line "beg")
     ("e" move-end-of-line "end")
     ("d" delete-region "del" :color blue)
     ("y" kill-ring-save "yank" :color blue)
     ("q" nil "quit")))



;;** Example 6: selective global bind

  (defhydra hydra-next-error (global-map "C-x")
    "next-error"
    ("`" next-error "next")
    ("j" next-error "next" :bind nil)
    ("k" previous-error "previous" :bind nil))

;; This example will bind "C-x `" in `global-map', but it will not
;; bind "C-x j" and "C-x k".
;; You can still "C-x `jjk" though.

;;** Example 7: toggle with Ruby-style docstring
(defvar whitespace-mode nil)
(defhydra hydra-toggle (:color pink)
  "
_a_ abbrev-mode:       %`abbrev-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
_t_ truncate-lines:    %`truncate-lines
_w_ whitespace-mode:   %`whitespace-mode

"
  ("a" abbrev-mode nil)
  ("d" toggle-debug-on-error nil)
  ("f" auto-fill-mode nil)
  ("t" toggle-truncate-lines nil)
  ("w" whitespace-mode nil)
  ("q" nil "quit"))
;; Recommended binding:
;; (global-set-key (kbd "C-c C-v") 'hydra-toggle/body)

;; Here, using e.g. "_a_" translates to "a" with proper face.
;; More interestingly:
;;
;;     "foobar %`abbrev-mode" means roughly (format "foobar %S" abbrev-mode)
;;
;; This means that you actually see the state of the mode that you're changing.

;;** Example 8: the whole menu for `Buffer-menu-mode'
(defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------                        (__)
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch                         (oo)
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch                      /------\\/
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur                 / |    ||
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only^^    *  /\\---/\\
_~_: modified      ^ ^                ^ ^                ^^                                 ~~   ~~
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))
;; Recommended binding:
;; (define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)

;;** Example 9: s-expressions in the docstring
;; You can inline s-expresssions into the docstring like this:
(defvar dired-mode-map)
(when (bound-and-true-p hydra-examples-verbatim)
  (require 'dired)
  (defhydra hydra-marked-items (dired-mode-map "")
    "
Number of marked items: %(length (dired-get-marked-files))
"
    ("m" dired-mark "mark")))

;; This results in the following dynamic docstring:
;;
;;     (format "Number of marked items: %S\n"
;;             (length (dired-get-marked-files)))
;;
;; You can use `format'-style width specs, e.g. % 10(length nil).

;;** Example 10: apropos family
(defhydra hydra-apropos (:color blue
                         :hint nil)
  "
_a_propos        _c_ommand
_d_ocumentation  _l_ibrary
_v_ariable       _u_ser-option
^ ^          valu_e_"
  ("a" apropos)
  ("d" apropos-documentation)
  ("v" apropos-variable)
  ("c" apropos-command)
  ("l" apropos-library)
  ("u" apropos-user-option)
  ("e" apropos-value))
;; Recommended binding:
;; (global-set-key (kbd "C-c h") 'hydra-apropos/body)

;;** Example 11: rectangle-mark-mode
(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                           :color pink
                           :post (deactivate-mark))
  "
  ^_k_^     _d_elete    _s_tring
_h_   _l_   _o_k        _y_ank
  ^_j_^     _n_ew-copy  _r_eset
^^^^        _e_xchange  _u_ndo
^^^^        ^ ^         _p_aste
"
  ("h" backward-char nil)
  ("l" forward-char nil)
  ("k" previous-line nil)
  ("j" next-line nil)
  ("e" hydra-ex-point-mark nil)
  ("n" copy-rectangle-as-kill nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("p" kill-rectangle nil)
  ("o" nil nil))

;; Recommended binding:
;; (global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)

;;* Helpers
(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defvar rectangle-mark-mode)
(defun hydra-ex-point-mark ()
  "Exchange point and mark."
  (interactive)
  (if rectangle-mark-mode
      (exchange-point-and-mark)
    (let ((mk (mark)))
      (rectangle-mark-mode 1)
      (goto-char mk))))

(provide 'init-hydra)
