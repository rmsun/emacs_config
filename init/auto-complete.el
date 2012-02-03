;; auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(set 'ac-comphist-file "~/.emacs.d/plugins/auto-complete/comphist.dat")

;;缺省配置：自动启动并加载几个sources。
(ac-config-default)
(setq ac-use-comphist t)

;;设置ac默认不启动
;;(setq ac-auto-start nil)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;(ac-set-trigger-key "TAB")


;; Show 0.8 second later
;; (setq ac-auto-show-menu 0.8)

;; (setq-default ac-sources '(ac-source-words-in-all-buffer))

;; Add ac-source-dictionary to ac-sources of all buffer
;; ac-config-default 是没有添加semantic和gtags、imenu支持的
;; 所以要明确添加进去。
(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-dictionary
                                        ac-source-semantic
                                        ac-source-semantic-raw
                                        ac-source-files-in-current-dir
                                        ac-source-gtags
                                        ac-source-imenu
                                        ac-source-words-in-same-mode-buffers
                                        ))))


;;重新配置候选键到C-p和C-n是为了避免和sementic插件的候选键冲突。
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;;add the org-mode.
(setq ac-modes
	  (append ac-modes '(org-mode objc-mode jde-mode sql-mode
								  change-log-mode text-mode
								  makefile-gmake-mode makefile-bsdmake-mo
								  autoconf-mode makefile-automake-mode)))


