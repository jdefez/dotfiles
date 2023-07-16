(set-face-attribute 'default nil :font "Monospace" :height 110)

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'modus-themes)

;; Activate your desired themes here
(load-theme 'modus-operandi t t)
(load-theme 'modus-vivendi t t)

;; Enable the preferred one
(enable-theme 'modus-vivendi)



(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
