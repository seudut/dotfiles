
;;; org-mode init File

;; refer http://doc.norang.ca/org-mode.html

;(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
;;
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;(add-hook 'org-mode-hook
;;          (lambda ()
;;                      (org-set-local 'yas/trigger-key [tab])
;;                      (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))


;(org-indent-mode 1)


;; org-todo
;; define more state of todo
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" ))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)

;; allow S-left/right to rotate state not set timestamp and add note
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; trigger a tags for the task when changing state
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


;; org-capture
(setq org-directory "~/Private/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))




;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;(setq org-capture-templates
;      (quote (("t" "todo" entry (file "~/git/org/refile.org")
;               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;              ("r" "respond" entry (file "~/git/org/refile.org")
;               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;              ("n" "note" entry (file "~/git/org/refile.org")
;               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
;               "* %?\n%U\n" :clock-in t :clock-resume t)
;              ("w" "org-protocol" entry (file "~/git/org/refile.org")
;               "* TODO Review %c\n%U\n" :immediate-finish t)
;              ("m" "Meeting" entry (file "~/git/org/refile.org")
;               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;              ("p" "Phone call" entry (file "~/git/org/refile.org")
;               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;              ("h" "Habit" entry (file "~/git/org/refile.org")
;               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))


;;; org-tag
; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?H)
                            ("@farm" . ?f)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("HOLD" . ?h)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("FARM" . ?F)
                            ("ORG" . ?O)
                            ("NORANG" . ?N)
                            ("crypt" . ?E)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)


;; Always hilight the current agenda line
(add-hook 'org-agenda-mode-hook
          '(lambda () (hl-line-mode 1))
          'append)



;; The following custom-set-faces create the highlights
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-mode-line-clock ((t (:background "grey75" :foreground "red" :box (:line-width -1 :style released-button)))) t))




(provide 'init-org)
