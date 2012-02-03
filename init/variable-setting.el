;; set for default major-mode
(setq-default default-major-mode 'text-mode)
;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)
;;在状态栏显示列号
(column-number-mode t)
;;在状态栏显示时间
(display-time-mode t)
;;在左侧显示行号
(global-linum-mode t)
(setq indicate-buffer-boundaries (quote left))
;;在状态栏显示文件大小
(size-indication-mode t)
;禁用启动画面
;;(setq inhibit-startup-message t)
;;去掉工具栏
(tool-bar-mode nil)
;;去掉菜单栏
(menu-bar-mode nil)
;;去掉滚动条
(scroll-bar-mode nil)
;;设定行距
(setq default-line-spacing 1)
;;页宽
(setq default-fill-column 80)
;;缺省模式
(setq default-mojor-mode 'text-mode)
;;语法加亮
(global-font-lock-mode t)
;;高亮显示区域选择
(transient-mark-mode t)
;;页面平滑滚动
(setq scroll-margin 3 scroll-conservatively 10000)
;;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;鼠标指针规避光标
;(mouse-avoidance-mode 'animate)
;;光标显示为一竖线
;(setq-default cursor-type 'bar)
;;透明
;(set-frame-parameter (selected-frame) 'alpha '(80 70))
;(add-to-list 'default-frame-alist '(alpha 95 85))
;;在标题栏提示目前我的位置
;(setq frame-title-format "zym@%b")
;;(setq frame-title-format `(,(user-login-name) "#" ,(system-name) "     " global-mode-string "     %f" ))
;;标题栏显示%f缓冲区完整路径%p页面百分数%l行号
;;(setq frame-title-format "%f")
;;使用X剪贴板
(setq x-select-enable-clipboard t)
;;设定剪贴板内容格式 适应firefox
;;(set-clipboard-coding-system 'ctext)
;;打开图片显示功能
(auto-image-file-mode t)
(auto-fill-mode t)
