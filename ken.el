;; (starter-kit-load "python")
(starter-kit-load "misc-recommended")
(starter-kit-load "org")

(mapc 'load (directory-files "~/.emacs.d/my-config" t "\\.el$")) 


