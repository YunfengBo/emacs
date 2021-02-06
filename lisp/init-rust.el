;; =================== Rust 设置 ==================================
(use-package rust-mode
  :init
  (setq rust-format-on-save t)
  :config
  (progn
    (define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
    (add-hook 'rust-mode-hook
              (lambda () (setq indent-tabs-mode nil))))
  )

(provide 'init-rust)
;;; init-lua.el ends here
