(starter-kit-load "yasnippet")
(starter-kit-load "misc-recommended")
(starter-kit-load "org")

;;======== Misc ========
(setq make-backup-files nil)
(setq auto-save-mode nil)
(setq auto-save-default nil)


;;======== Disable ring-bell ===========
;;(setq ring-bell-function 'LINE)
(setq ring-bell-function 'ignore)
;;======== ignore NUM =========
(global-linum-mode t)  

;;======== HIGHLIGHT-CURRENT_LINE ========
(global-hl-line-mode t)


;;======== 滚动设置 ========
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)


;;======== TAB =========
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4) 

;;======== FONT =========
(when (eq system-type 'darwin)
      ;; default Latin font (e.g. Consolas)
      (set-face-attribute 'default nil :family "Anonymous Pro")
;;     (set-face-attribute 'default nil :family "Monaco")

      ;; default font size (140)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly. 
      (set-face-attribute 'default nil :height 160)

      ;; use specific font for Korean charset.
      ;; if you want to use different font size for specific charset,
      ;; add :size POINT-SIZE in the font-spec.
 ;;     (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

      ;; you may want to add different for other charset in this way.
;;      (set-fontset-font t 'han (font-spec :name "兰亭黑-简"))
;;      (set-fontset-font t 'han (font-spec :name "圆体-简"))
      (set-fontset-font t 'han (font-spec :name "冬青黑体简体中文"))
      
)



;;======== MacTex ==========

;; set path for MacTex
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))


;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))


;;======== COLOR THEME =========
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-billw)
;;(require 'color-theme-sanityinc-tomorrow)
;;(color-theme-sanityinc-tomorrow--define-theme night)
;;(load-theme 'anti-zenburn t)
;;(load-theme 'zenburn t)

;;======== BUFF-MOVE ========
(require 'buffer-move)

;;======== EVIL ========
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "e" 'helm-find-files
  "b" 'helm-mini
  "k" 'kill-buffer
  "f" 'helm-occur)

(require 'evil)
(evil-mode 1)

;;(require 'evil-org)

;;======== FCI ========
(require 'fill-column-indicator)


;;======== POWERLINE =======
;;(require 'powerline)
;;(powerline-default-theme)
;;(setq powerline-arrow-shape 'arrow)
;;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
(require 'powerline-evil)
;;(powerline-center-evil-theme)
(powerline-evil-vim-color-theme)


;;========== SR-SPEEDBAR ==========
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(add-hook 'speedbar-mode-hook '(lambda () (linum-mode -1)))
(speedbar-add-supported-extension ".lua")
   (add-to-list 'speedbar-fetch-etags-parse-list
    	    '("\\.lua" . speedbar-parse-c-or-c++tag))


;;========== autopair =========
;;(require 'autopair)  
;;(autopair-global-mode)

;;========== SMARTPARENS =========
(require 'smartparens-config)
(smartparens-global-mode)
(require 'smartparens-lua)


(sp-with-modes '(lua-mode)
 (sp-local-pair "for" nil :actions :rem)
 (sp-local-pair "if" nil :actions :rem)
 (sp-local-pair "while" nil :actions :rem)
 (sp-local-pair "function" nil :actions :rem)
 )
;;(sp-local-pair 'lua-mode "for" nil :actions :rem)
;;(sp-local-pair 'lua-mode "if" nil :actions :rem)
;;(sp-local-pair 'lua-mode "while" nil :actions :rem)
;;(sp-local-pair 'lua-mode "function" nil :actions :rem)

;;========== TABBAR ==========
(require 'tabbar)
(tabbar-mode 1)
(setq tabbar-use-images nil)
(global-set-key [(meta j)] 'tabbar-backward)  
(global-set-key [(meta k)] 'tabbar-forward)  
;;(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;;(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;;(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;;(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;;(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                      ; scroll bar when your mouse is moving.
(require 'tabbar-ruler)
(tabbar-ruler-group-by-projectile-project)

;;======== POS-TIP ========
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t) 

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))


;;======== COMPANY-MODE =========
;;(add-hook 'after-init-hook 'global-company-mode)
;;(setq company-auto-complete t)
;;(setq company-idle-delay 0.1)
;;(setq company-minimum-prefix-length 1)




;;======== AUTO_COMPLETE =========
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;;(require 'org-ac)
;;(org-ac/config-default)

(require 'ac-helm)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)


(require 'auto-complete-etags)
(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-etags))))


(setq path-to-ctags "/usr/local/Cellar/ctags/5.8/bin/ctags")
(defun create-tags (dir-name)        
  "Create tags file."
  (interactive "DDirectory: ") 
  (shell-command 
   (format "%s -f %s/TAGS -eR %s" path-to-ctags        
           (directory-file-name dir-name) 
           (directory-file-name dir-name)))
  )
;; tag list
(setq tags-table-list '("~/Work/libraries/quick-3.2rc1/quick/framework/TAGS"))


;;======== MOVE-TEXT ========
;;(require 'move-text)
;;(move-text-default-bindings)

;;======== DIRED-SINGLE ======
(autoload 'dired-single-buffer "dired-single" "" t)
(autoload 'dired-single-buffer-mouse "dired-single" "" t)
(autoload 'dired-single-magic-buffer "dired-single" "" t)
(autoload 'dired-single-toggle-buffer-name "dired-single" "" t)



(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
   loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
     (function
      (lambda nil (interactive) (dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
     ;; we're good to go; just add our bindings
     (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))


;;======== helm ==========         
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'helm-projectile)
(helm-projectile-on)

;;======== PROJECTILE ======
(require 'projectile)
(projectile-global-mode)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-enable-caching t)

;;======== FLYCHECK =======
(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode)
;;(setq flycheck-check-syntax-automatically 1)

;;======== HELM_FLYCHECK =========
(eval-after-load 'flycheck
   '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

;;======== PROTOBUF ========
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

;;======== GRADLE-MODE ========
(require 'gradle-mode)
(add-to-list 'auto-mode-alist '("\\.gradle$" . pgradle-mode))
;; (gradle-mode 1)

;;======== ANDROID-MODE ========
(require 'android-mode)
(setq android-mode-sdk-dir "/usr/local/adt/sdk")
(setq android-mode-builder 'gradle)

;;======== LUA-MODE ========
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 2)

;;(add-hook 'lua-mode-hook 
;;          (lambda () (unless (fboundp 'lua-calculate-indentation-right-shift-next)
;;                       (load-file (locate-file "my-lua.el" load-path)))))

;;======== DTRT-INDENT ========
(require 'dtrt-indent)
(dtrt-indent-mode 1)


;;======== WEATHER-METRO ========
(setq weather-metno-location-name "Shanghai, China"
      weather-metno-location-latitude 48
      weather-metno-location-longitude 16)

;;======== CALENDAR ========
(setq calendar-remove-frame-by-deleting t)
(setq chinese-calendar-celestial-stem
          ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
          chinese-calendar-terrestrial-branch
          ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;;======== ORGMODE ========
(setq org-directory "~/Documents/emacs/org")
(appt-activate 1)
(setq diary-file (concat org-directory "/diary.org"))
(setq org-default-notes-file (concat org-directory "/note.org"))


;;(setq org-agenda-files (list 
;;                        (concat org-directory "/inbox.org")  
;;                        (concat org-directory "/note.org")  
;;                        (concat org-directory "/personal.org")  
;;                        (concat org-directory "/trash.org")  
;;                        (concat org-directory "/finished.org")  
;;                        (concat org-directory "/project.org")))  
(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))

;; 使用org-capture
(global-set-key "\C-cc" 'org-capture)

(setq org-capture-templates 
      '(("p" "Project" entry (file+headline (concat org-directory "/project.org") "project") "** TODO %?\n %i\n  %a")
        ("i" "Inbox" entry (file (concat org-directory "/inbox.org")) "** TODO %? %^G %i\n %a")
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
   (("inbox.org" :level . 1)
    ("trash.org" :level . 1)
    ("personal.org" :level . 1) 
    ("project.org" :level . 1)
    ("note.org" :level . 1)
    ("finished.org":level . 1))
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



;;======== CEDET =======
;;(require 'cedet)
;;(load-file "~/.emacs.d/cedet-1.0pre6/common/cedet.el")
;;(setq stack-trace-on-error t)
;;(global-semantic-tag-folding-mode 1)
;;(global-ede-mode 1)
;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)

;;======== ECB ========
;;(require 'ecb)
;;(require 'ecb-autoloads)
;;(setq ecb-tip-of-the-day nil)
;;(define-key global-map [(f3)] 'ecb-goto-window-directories)
;;(define-key global-map [(f4)] 'ecb-goto-window-sources)
;;(define-key global-map [(f5)] 'ecb-goto-window-methods)
;;(define-key global-map [(f6)] 'ecb-goto-window-history)

;;;; 隐藏和显示ecb窗口
;;(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
;;(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;
;;(global-set-key [M-left]  'windmove-left)
;;(global-set-key [M-right] 'windmove-right)
;;(global-set-key [M-up]    'windmove-up)
;;(global-set-key [M-down]  'windmove-down)

;; 开启后最大化窗口
(custom-set-variables '(initial-frame-alist 
                        (quote ((fullscreen . maximized))) )) 


;;========= 回车自动缩进 =========
(global-set-key (kbd "RET") 'newline-and-indent)


