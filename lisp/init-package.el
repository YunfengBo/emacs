;; =================== 插件管理 —— 使用插件管理器 ====================
;; 使用国内的软件源
(setq package-archives
      '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(require 'package)

;; 27.0 之后，不再需要调用 package-initialize
(when (version< emacs-version "27.0")
  (package-initialize))

;; 更新包管理清单，并安装 use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; 增强的undo/redo，C-/ to undo, and C-? to redo
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  )

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (setq yas-also-auto-indent-first-line t))

(use-package yasnippet-snippets
  :ensure t)

;; company
(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :diminish company-mode
  :commands company-mode
  :init
  (setq
   company-dabbrev-ignore-case nil
   company-dabbrev-code-ignore-case nil
   company-dabbrev-downcase nil
   company-idle-delay 0.5
   company-minimum-prefix-length 2
   company-selection-wrap-around t)
  :config
  ;; disables TAB in company-mode, freeing it for yasnippet
  (global-company-mode)
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "TAB") nil))

;; 多光标选择
(use-package multiple-cursors
  :ensure t
  :config
  ;; multiple-cursors
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(provide 'init-package)
;;; init-package.el ends here
