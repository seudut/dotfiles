;;---------------------------------------------------------------------------------------
;; package
;; http://y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    magit
    helm
    ido-ubiquitous
    yasnippet
    evil
    ido-vertical-mode
    smex
    color-theme
    color-theme-sanityinc-tomorrow
    key-chord
;    powerline-evil
    powerline
    evil-leader
    flx-ido
    flx
    auto-complete
    fiplr
    w3m
    ace-jump-mode
;    el-get
    color-identifiers-mode
;    elscreen
    moe-theme
    monokai-theme
    molokai-theme
    tangotango-theme
    cyberpunk-theme
    hydra
    projectile
    projectile-speedbar
    ecb
    ggtags
    irony
    yasnippet
    auto-complete-c-headers
    iedit
    flymake-google-cpplint
    flymake-cursor
    google-c-style
    recentf-ext
    linum-relative
    jekyll-modes
    workgroups2
  ) "a list of packages to ensure are installed at launch.")

(require 'cl)
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))


;;---------------------------------------------------------------------------------------
;; El-get
;; https://github.com/dimitri/el-get
;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


(el-get-bundle seudut/color-theme-tangotango
;        :features color-theme-tangotango
;        (color-theme-tangotango)
        )

;(el-get-bundle Dewdrops/powerline)

(el-get-bundle emacsmirror/sr-speedbar)
(el-get-bundle seudut/elscreen)

(provide 'my-packages)
