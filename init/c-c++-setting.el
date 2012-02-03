;;set for auto-newline and hungry-state
;;以及编程风格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (c-toggle-auto-state)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (c-toggle-auto-state)))

;;; disable indent-tabs-mod
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
