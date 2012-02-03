;;for embedded EDGE
(require 'semantic/sb)
(setq semantic-default-submodes
        '(global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-idle-completions-mode
          global-semantic-decoration-mode
          global-semantic-highlight-func-mode 
          global-semantic-highlight-edits-mode (if window-system 1 -1)
          global-semantic-show-unmatched-syntax-mode
          global-semantic-show-parser-state-mode
          global-semantic-mru-bookmark-mode
          global-semantic-idle-local-symbol-highlight-mode
          ;;global-semantic-stickyfunc-mode 开启后将emacs的tab覆盖
	  ))

(semantic-mode 1)
(global-ede-mode 1)

;;这些已经不需要了，因为auto-complete会把候选关键字用菜单形式显示。
;; (defun my-c-mode-cedet-hook ()
;;  (local-set-key "." 'semantic-complete-self-insert)
;;  (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;这个很重要，senmentic在解析符号引用时必须要知道除了系统路径外的头文件所在路径
(defconst user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public" "../*"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(let ((include-dirs user-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode)
	  (semantic-add-system-include dir 'python-mode))
        include-dirs))

;;设置tag间的快速跳转，通过C-x C-SPC 可以返回
(global-set-key [f12] 'semantic-ia-fast-jump)

(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;在函数和声明和实现间跳转，一般的，函数声明放在h文件中，函数的实现放在cpp文件中，光标在函数体的时候通过
;;M-x semantic-analyze-proto-impl-toggle可以跳到函数声明去，在声明处再执行的话就会再跳回函数体，
(define-key semantic-mode-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

;;set for pulse
;;如果你想在你的程序里面使用淡入淡出效果，直接调用上面的pulse-momentary-highlight-one-line和
;;pulse-momentary-highlight-region函数，也可以为你的命令增加advice
(setq pulse-command-advice-flag (if window-system 1 nil))

(defadvice goto-line (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))
(defadvice find-tag (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice tags-search (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice tags-loop-continue (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice pop-tag-mark (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice imenu-default-goto-function (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when pulse-command-advice-flag
    (pulse-momentary-highlight-one-line (point))))
(defadvice cua-exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))
(defadvice switch-to-buffer (after pulse-advice activate)
  "After switch-to-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice previous-buffer (after pulse-advice activate)
  "After previous-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice next-buffer (after pulse-advice activate)
  "After next-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice ido-switch-buffer (after pulse-advice activate)
  "After ido-switch-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice beginning-of-buffer (after pulse-advice activate)
  "After beginning-of-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
