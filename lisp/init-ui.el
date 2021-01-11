;; =================== 字体和基本颜色设置 ============================
;;windows 字体设置
(defun windows_font()
  (set-face-attribute 'default nil :font "Consolas 11")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 26)))

  ;; Don’t compact font caches during GC.
  ;; 解决win10下中文字体导致响应速度慢的问题
  (setq inhibit-compacting-font-caches t)
  )

;;gnu/linux 字体设置
(defun linux_font()
  (set-face-attribute 'default nil :font "Droid Sans Mono 10")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "文泉驿点阵正黑" :size 15)))
  )

;;只有在 GUI 方式下，才设置字体、窗口位置等，文本方式启动时不用设置
(if window-system
    (progn
      ;;设置字体
      (if (string= "windows-nt" system-type) (windows_font))
      (if (string= "gnu/linux" system-type) (linux_font))

      ;;设置窗口位置
                                        ;(set-frame-position (selected-frame) 80 0)

      ;;设置窗口宽高
      (set-frame-width (selected-frame) 128)
      (set-frame-height (selected-frame) 44)
      )
  )

;; 窗口切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; 高亮显示无用的行尾空白
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; 颜色主题
(load-theme 'tango-dark t)

(provide 'init-ui)
;;; init-ui.el ends here
