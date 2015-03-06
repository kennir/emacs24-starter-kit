;;======== ORGMODE ========
(setq org-directory "~/Documents/emacs/org")
(appt-activate 1)
(setq diary-file (concat org-directory "/diary.org"))
(setq org-default-notes-file (concat org-directory "/note.org"))


(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))

;; 使用org-capture
(global-set-key "\C-cc" 'org-capture)

(setq org-capture-templates 
      '(("i" "Inbox" entry (file (concat org-directory "/inbox.org")) "** TODO %? %^G %i\n %a")
        ("P" "Personal" entry (file+headline (concat org-directory "/personal.org") "personal") "** TODO %? %^G\n %a")
        ("n" "Note" entry (file+datetree (concat org-directory "/note.org")) "* %?\nEntered on %U\n %i\n  %a")
))

;; diary
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)

;; 将项目转接在各文件之间，方便清理和回顾。
(custom-set-variables
'(org-refile-targets 
  (quote 
   (("project.org" :level . 1)
    ("inbox.org" :level . 1)
    ("trash.org" :level . 1)
    ("personal.org" :level . 1) 
    ("note.org" :level . 1))
   )
))


(setq org-todo-keywords
    '((sequence "TODO(t!)" 
                "NEXT(n)" 
                "WAITTING(w)" 
                "BUG(b)" 
                "SOMEDAY(s)" 
                "|"
                "DONE(d@/!)" 
                "ABORT(a@/!)")))   


(setq org-tag-alist '((:startgroup . "where")
                      ("@office" . ?o) 
                      ("@home" . ?h)
                      ("@outdoor" . ?O)
                      (:endgroup . nil)
                      (:startgroup . "when")
                      ("@computer" . ?c)
                      ("@call" . ?l)
                      (:endgroup . nil)
                      (:startgroup . "what")
                      ("@work" . ?w)
                      ("@finance" . ?f)
                      ("@document" . ?D)
                      (:endgroup . nil)
))



(require 'org-projectile)
(setq org-projectile:projects-file (concat org-directory "/project.org"))
(add-to-list 'org-capture-templates (org-projectile:project-todo-entry))
;;(setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
(global-set-key (kbd "C-c n p") 'org-projectile:project-todo-completing-read)


;; (require 'org-trello)
;; (add-hook 'org-mode-hook 'org-trello-mode)










