;;======== PROTOBUF ========
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))



(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))




;;======== LUA-MODE ========
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)


;;; hide-show
(setq hs-allow-nesting t)

(add-hook 'lua-mode-hook (lambda () (hs-minor-mode 1) ))
(add-hook 'protobuf-mode-hook (lambda () (hs-minor-mode 1)))

(require 'hideshowvis)
(dolist (hook (list 'lua-mode-hook
                    'protobuf-mode-hook))
  (add-hook hook 'hideshowvis-enable))
;;(hideshowvis-symbols)


;;======= android mode ========
(setq android-mode-sdk-dir "/usr/local/adt/sdk")
