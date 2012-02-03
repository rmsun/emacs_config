;;for backward-word delete
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-h") 'backward-kill-word)

;;Alt+g: 跳转到*行
(global-set-key "\M-g" 'goto-line)

;;Alt+m: 设置备注
(global-set-key "\M-m" 'set-mark-command)

;;;; 各窗口间切换 pnbf
(define-key global-map "\C-ck" 'windmove-up)
(define-key global-map "\C-cj" 'windmove-down)
(define-key global-map "\C-ch" 'windmove-left)
(define-key global-map "\C-cl" 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;;键绑定****************
;;WIN+s进入shell
(global-set-key (kbd "s-s") 'shell)

;;
;;(global-unset-key (kbd "C-SPC"))

;; 复制键绑定
;; Copy Word:C-c w
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
   (interactive "P")
   (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
  (end (progn (forward-word arg) (point))))
     (copy-region-as-kill beg end))
)
(global-set-key (kbd "C-c w")         (quote copy-word))

;;Copy Line:C-c l 与semantic默认键冲突
;;(defun copy-line (&optional arg)
  ;;"Save current line into Kill-Ring without mark the line "
   ;;(interactive "P")
   ;;(let ((beg (line-beginning-position)) 
  ;;(end (line-end-position arg)))
     ;;(copy-region-as-kill beg end))
 ;;)
;;(global-set-key (kbd "C-c l")         (quote copy-line))

;;Copy Paragraph:C-c p
(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
   (interactive "P")
   (let ((beg (progn (backward-paragraph 1) (point))) 
  (end (progn (forward-paragraph arg) (point))))
     (copy-region-as-kill beg end))
)
(global-set-key (kbd "C-c p")         (quote copy-paragraph))

;;Copy String:C-c s
(defun copy-string (&optional arg)
   "Copy a sequence of string into kill-ring"
    (interactive)
    (setq onPoint (point))
    (let ( 
     ( beg  (progn (re-search-backward "[\t ]" (line-beginning-position) 3 1) 
            (if (looking-at "[\t ]") (+ (point) 1) (point) ) )
      )
           ( end  (progn  (goto-char onPoint) (re-search-forward "[\t ]" (line-end-position) 3 1)
            (if (looking-back "[\t ]") (- (point) 1) (point) ) )
       ))
    (copy-region-as-kill beg end)
  )
)
(global-set-key (kbd "C-c s")         (quote copy-string))

;;tabbar快捷键设置
(global-set-key (kbd "C-<tab>") 'tabbar-forward)
(global-set-key (kbd "M-<tab>") 'tabbar-backward)
