(require 'ido)
(ido-mode t)
(ido-vertical-mode 1)


;;(setq ido-use-faces t)
;;(set-face-attribute 'ido-vertical-first-match-face nil
;;                    :background nil
;;                    :foreground "orange")
;;(set-face-attribute 'ido-vertical-only-match-face nil
;;                    :background nil
;;                    :foreground nil)
;;(set-face-attribute 'ido-vertical-match-face nil
;;                    :foreground nil)
;;(ido-vertical-mode 1);



(require 'flx-ido)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
