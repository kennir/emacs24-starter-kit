;;======== Misc ========
(server-mode)

;;(add-hook 'after-init-hook 'org-agenda-list)

(setq make-backup-files nil)
(setq auto-save-mode nil)
(setq auto-save-default nil)

;;======== ring-bell ===========
;;(setq ring-bell-function 'LINE)
(setq ring-bell-function 'ignore)

;;======== ignore NUM =========
(global-linum-mode t)  


;;======== HIGHLIGHT-CURRENT_LINE ========
(global-hl-line-mode t)

;;disable toolbar
(tool-bar-mode -1)

;;======== 滚动设置 ========
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;;(setq scroll-preserve-screen-position t)

;;======== TAB =========
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4) 

;;======== FONT =========
(when (eq system-type 'darwin)
      ;; default Latin font (e.g. Consolas)
      ;; (set-face-attribute 'default nil :family "Anonymous Pro")
      ;; (set-face-attribute 'default nil :family "Monaco")
      ;; (set-face-attribute 'default nil :family "Edlo")

      ;; default font size (140)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly. 
      ;; (set-face-attribute 'default nil :height 140)

      ;; use specific font for Korean charset.
      ;; if you want to use different font size for specific charset,
      ;; add :size POINT-SIZE in the font-spec.
      ;; (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

      ;; you may want to add different for other charset in this way.
      ;;(set-fontset-font t 'han (font-spec :name "兰亭黑-简"))
      ;; (set-fontset-font t 'han (font-spec :name "思源黑体 CN"))
      ;; (set-fontset-font t 'han (font-spec :name "圆体-简"))
      ;; (set-fontset-font t 'han (font-spec :name "冬青黑体简体中文"))

      
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


;; 开启后最大化窗口
;; (custom-set-variables '(initial-frame-alist 
(custom-set-variables '(default-frame-alist 
                        (quote ((fullscreen . maximized))) )) 

;; 设置对其模式
(setq align-c++-modes (quote (c++-mode c-mode java-mode lua-mode protobuf-mode)))

;; showhide
(setq hs-hide-comments-when-hiding-all nil)


;;========= 回车自动缩进 =========
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-M-,") 'helm-imenu-anywhere)
(global-set-key (kbd "C-,") 'ido-imenu-anywhere)
(global-set-key (kbd "C-M-a") 'align)
