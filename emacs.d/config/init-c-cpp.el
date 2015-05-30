

;---------------------------------------------------------------------------------------
;; irony-mode
;;
; set LD_LIBRARY_PATH 
(setenv "LD_LIBRARY_PATH" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/")
; load irony-mode
;( add-to-list 'load-path (expand-file-name "~/.emacs.d/irony-mode/elisp/"))
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;---------------------------------------------------------------------------------------
;; auto-complete, yasnippt, auto-complete-c-headers, iedit
;;
;; c/c++ auto-complete, yasnippet, auto-complet-c-headers
;;https://www.youtube.com/watch?v=HTUE03LnaXA&list=PL-mFLc7R_MJet8ItKipCtYc7PWoS5KTfM
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; input TAB to 
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include")
)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;; iedit, fix iedit bug in Mac, C-c ; to trigger multiple cursor edit
(define-key global-map (kbd "C-c ;") 'iedit-mode)


;; flymake-google-cpplint-load
;; define a function for flymake initialization
;(defun my:flymake-google-init ()
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;  (flymake-google-cpplint-load)
;  )
;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-hook 'google-set-c-style)
;(add-hook 'c++-mode-hook 'google-make-newline-indent)



;---------------------------------------------------------------------------------------
;; cedet
;;
(semantic-mode 1)
;; let's define a function which adds semantic as a suggestion backend to auto complete
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; turn on ede mode
(global-ede-mode 1)

;(ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp"
;		      :include-path '("/../my_inc"))
;; you can use system-include-path for setting up the system header file locations.

;; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)


(provide 'init-c-cpp)
