;;============================ 基本配置 =============================
(custom-set-variables
 ;; 显示 tab bar
 '(tab-bar-mode t)
 ;; 启动界面: t: disable nil: enable
 '(inhibit-startup-message t)
 ;; 显示列号
 '(column-number-mode t)
 ;; 括号配对
 '(show-paren-mode t)
 '(show-paren-mode-style 'parentheses)
 ;; 出错时的提示声
 '(visible-bell t)
 ;; default tab宽度(Use [Meta-q TAB] to insert a TAB)
 '(tab-width 4)
 ;; enlarge the size of kill ring
 '(kill-ring-max 50)
 ;; truncate long lines instead of display '$'
 '(truncate-partial-width-windows nil)
 ;; 不创建备份文件 as filename~
 '(make-backup-files nil)
 ;; Insert only spaces when press TAB
 '(indent-tabs-mode nil)
 ;; display image
 '(auto-image-file-mode t)
 ;; 工具栏：t显示 nil不显示
 '(tool-bar-mode nil)
 ;; 在标题栏提示你目前在什么位置
 '(frame-title-format "%b@%f")
 ;; 行号：t显示 nil不显示
 '(global-linum-mode t)
 ;; 显示缓冲区（文件）大小
 '(size-indication-mode t)
 ;; 自动保存
 ;'(desktop-save-mode 1)
 ;; 自动保存间隔
 '(auto-save-interval 600)
 ;;设置光标不闪
 '(blink-cursor-mode 1)
 ;; default encoding
 '(default-buffer-file-coding-system 'utf-8)
 ;; user's informations
 '(user-full-name "Jim Bo")
 '(user-mail-address "Yunfeng.Bo@Gmail.com")
 )

;; =================== 一些基本设置 =================================
;;启动服务，方便快速打开文件
;; 启动服务之前，先强制关闭之前的服务，使最后打开的emacs作为服务
(server-force-delete)
(server-start)

;;设置光标为线条状
(setq-default cursor-type 'bar)
;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1 scroll-margin 2 scroll-conservatively 10000)
;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

(global-font-lock-mode t)
;; 滚动条位置 disable: nil right: 'right left: 'left
(set-scroll-bar-mode 'right)

;; Time display
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-data t)

;; Use y n as yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; 缺省目录
(setq default-directory "~/")

;; Ctrl-Space用来切换输入法，取消默认的功能
(global-unset-key (kbd "C-SPC"))

;; C-@来标记实在太麻烦了，改用Alt-Space
(global-set-key (kbd "M-SPC") 'set-mark-command)

;;设定句子结尾，主要是针对中文设置
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;自动重载更改的文件
(global-auto-revert-mode 1)

;; UTF-8 settings
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(if (string= "windows-nt" system-type) (set-clipboard-coding-system 'euc-cn))
(if (string= "gnu/linux" system-type) (set-clipboard-coding-system 'utf-8))

;; 自动识别文件编码，中文优先
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
;; 新建文件使用utf-8，行末结束符平台相关
(prefer-coding-system 'utf-8)

;; 连续滚屏
(defun hold-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down -1)
    (line-move-to-column tmp)
    )
  )

(defun hold-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down 1)
    (line-move-to-column tmp)
    )
  )
(global-set-key (kbd "M-n") 'hold-line-scroll-up)
(global-set-key (kbd "M-p") 'hold-line-scroll-down)

;; 跳转到指定行，[M-g M-g]，也可以实现
(global-set-key [?\C-c ?\C-g] 'goto-line)

;; M-; 注释/反注释当前激活的区域。如果没有激活区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加注释
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; 使用ibuffer来管理各个buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-main)
;;; init-main.el ends here
