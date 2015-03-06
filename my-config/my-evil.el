(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)


(define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (evil-scroll-down nil)))

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))



(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

(require 'evil-leader)
;; (evil-leader/set-leader "<SPC>")
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-this-buffer
  "n" 'neotree-toggle
  "i" 'ido-imenu-anywhere
  "s" 'save-buffer
  "q" 'delete-frame
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file
  "pj" 'projectile-find-tag
  "ci" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-copy-and-comment-lines
  "ht" 'hs-toggle-hiding
  "hs" 'hs-show-all
  "hh" 'hs-hide-all
  )

(with-eval-after-load 'evil
  (require 'evil-anzu))


(add-hook 'lua-mode-hook #'evil-smartparens-mode)
