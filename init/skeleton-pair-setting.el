;; ;; auto pair
(setq-default skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "`") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

;; ;; Paren experiment
;; (setq skeleton-pair t)
;; (defvar my-skeleton-pair-alist
;;   '((?\) . ?\()
;;     (?\] . ?\[)
;;     (?} . ?{)
;;     (?> . ?<)
;;     (?' . ?')
;;     (?" . ?")))

;; (defun my-skeleton-pair-end (arg)
;;   "Skip the char if it is an ending, otherwise insert it."
;;   (interactive "*p")
;;   (let ((char last-command-char))
;;     (if (and (assq char my-skeleton-pair-alist)
;;              (eq char (following-char)))
;;         (forward-char)
;;       (self-insert-command (prefix-numeric-value arg)))))

;; (dolist (pair my-skeleton-pair-alist)
;;   (global-set-key (char-to-string (first pair)) 'my-skeleton-pair-end)
;;   ;; If the char for begin and end is the same, use the original skeleton
;;   (global-set-key (char-to-string (rest pair)) 'skeleton-pair-insert-maybe))

;; (defadvice backward-delete-char-untabify (before my-skeleton-backspace activate)
;;   "When deleting the beginning of a pair, and the ending is next char, delete it too."
;;   (let ((pair (assq (following-char) my-skeleton-pair-alist)))
;;     (and pair
;;          (eq (preceding-char) (rest pair))
;;          (delete-char 1))))
