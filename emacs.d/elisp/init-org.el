

;; http://doc.norang.ca/org-mode.html  Org Mode - Organize Your Life In Plain Text!

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(global-set-key (kbd "<f12>") 'org-agenda)

(setq org-agenda-files (quote ("~/Private/org")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "ONGOING(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" ))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("ONGOING" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("ONGOING" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; change a task state C-c C-t Key
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)



;; Org Capture
(setq org-directory "~/Private/org/")
(setq org-default-notes-file (concat org-directory "refile.org"))
(setq org-default-diary-file (concat org-directory "diary.org"))

(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "Todo" entry (file org-default-notes-file)
               "* TODO %?\n\n  %U\n  %a\n" :clock-in t :clock-resume t)
              ("r" "Respond" entry (file org-default-notes-file)
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n  %U\n  %a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "Note" entry (file org-default-notes-file)
               "* %? :NOTE:\n\n  %U\n  %a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree org-default-diary-file)
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "Org-protocol" entry (file org-default-notes-file)
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file org-default-notes-file)
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file org-default-notes-file)
               "* PHONE %? :PHONE:\n  %U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file org-default-notes-file)
               "* NEXT %?\n\n  %U\n  %a\n\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))


(provide 'init-org)
