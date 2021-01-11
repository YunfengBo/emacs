;;============================ 基本配置 =============================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-image-file-mode t)
 '(auto-save-interval 600)
 '(blink-cursor-mode 1)
 '(column-number-mode t)
 '(default-buffer-file-coding-system 'utf-8)
 '(frame-title-format "%b@%f" t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kill-ring-max 50)
 '(make-backup-files nil)
 '(package-selected-packages
   '(yasnippet yasnippet-snippets use-package undo-tree multiple-cursors counsel company))
 '(show-paren-mode t)
 '(show-paren-mode-style 'parentheses)
 '(size-indication-mode t)
 '(tab-bar-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil)
 '(user-full-name "Jim Bo")
 '(user-mail-address "Yunfeng.Bo@Gmail.com")
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))
(require 'init-main)
(require 'init-shell)
(require 'init-ui)
(require 'init-package)
