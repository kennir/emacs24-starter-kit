;;========== SR-SPEEDBAR ==========
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(add-hook 'speedbar-mode-hook '(lambda () (linum-mode -1)))
(speedbar-add-supported-extension ".lua")
   (add-to-list 'speedbar-fetch-etags-parse-list
             '("\\.lua" . speedbar-parse-c-or-c++tag))
