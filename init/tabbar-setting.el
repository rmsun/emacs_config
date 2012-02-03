(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'tabbar)
(tabbar-mode t)
(defun tabbar-buffer-groups (buffer)
:;;"Define tabbar groups depending on major mode and buffer name"
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Misc")
      )
     ((eq major-mode 'org-mode)
      '("org")
      )
     ((eq major-mode 'muse-mode)
      '("muse")
      )
     ((memq major-mode
            '(fundamental-mode help-mode apropos-mode Info-mode Man-mode))
      '("Misc")
      )
     ((memq major-mode
            '(c-mode c++-mode))
      '("Cpp")
      )
     ((eq major-mode 'emacs-lisp-mode)
      '("Emacs-lisp")
      )
     ((memq major-mode
            '(php-mode nxml-mode nxhtml-mode))
      '("WebDev")
      )
     ((memq major-mode
            '(tex-mode latex-mode text-mode snippet-mode))
      '("Text")
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      '("Mail")
      )
     ((string-equal "*" (substring (buffer-name) 0 1))
      '("Emacs Buffer")
      )
     (t
      '("Main")
      )
     )))

;; 设置tabbar外观  
;; 设置默认主题: 字体, 背景和前景颜色，大小  
(set-face-attribute 'tabbar-default-face nil  
                    :family "DejaVu Sans Mono"  
                    :background "gray80"  
                    :foreground "gray30"  
                    :height 1.0  
                    )  
;; 设置左边按钮外观：外框框边大小和颜色  
(set-face-attribute 'tabbar-button-face nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70")  
                    )  
;; 设置当前tab外观：颜色，字体，外框大小和颜色  
(set-face-attribute 'tabbar-selected-face nil  
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
                    :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold  
                    )  
;; 设置非当前tab外观：外框大小和颜色  
(set-face-attribute 'tabbar-unselected-face nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 2 :color "#00B2BF")  
                    ) 
