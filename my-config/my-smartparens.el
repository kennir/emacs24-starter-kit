
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
