;; =================== Shell 设置 ===================================
(require 'eshell)
(require 'em-alias)
;;(require 'cl)

;; F1进入shell
(global-set-key [f1] 'eshell)

;; 当shell退出时自动关闭其buffer
(add-hook 'shell-mode-hook 'mode-hook-func)
(defun mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                        #'kill-buffer-on-exit))
(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

(defalias 'ff 'find-file)
(defalias 'ffo 'find-file-other-window)

(provide 'init-shell)
;;; init-shell.el ends here
