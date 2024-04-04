;; ===================================
;; Emacs profile
;; ======================================
(require 'package)
 
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
 
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

; Installs packages
(defvar myPackages
  '(better-defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    ))

;; Scans the list in myPackages
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================
(load-theme 'spacemacs-dark t)

(setq inhibit-startup-message t)   
(global-display-line-numbers-mode 1) 

;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ===================================
;; Auto-generated files
;; ===================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" default))
 '(package-selected-packages
   '(highlight-indent-guides spacemacs-theme py-autopep8 material-theme flycheck elpy better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
