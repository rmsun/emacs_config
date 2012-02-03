;;==============================================================================
;;语言设置
;;==============================================================================
(set-language-environment 'Chinese-GB)
(setq current-language-environment "Chinese-GBK") 
(set-keyboard-coding-system 'utf-8)
;;注意，这个很重要，一般网页的中文编码格式是GB2312不是utf-8因此
;;复制到emacs过程中需要转换。euc-cn是gb2312的编码格式
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
(prefer-coding-system 'utf-8)
;;输入法设置
(load-library "wubi")
(set-input-method "chinese-wubi")
