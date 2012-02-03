(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;;I like to see my buffers sorted by major-mode, so I add this bit too:
(setq ibuffer-default-sorting-mode 'major-mode)

;;You can define your filters and groups in the buffer list itself.
(setq ibuffer-saved-filter-groups
      (quote
       (("default"
         ("Organization" (or
                          (mode . diary-mode)
                          (mode . org-mode)
                          (mode . org-agenda-mode)))
         ("Gnus & News" (or
                         (mode . message-mode)
                         (mode . bbdb-mode)
                         (mode . mail-mode)
                         (mode . gnus-group-mode)
                         (mode . gnus-summary-mode)
                         (mode . gnus-article-mode)
                         (name . "^\\.bbdb$")
                         (name . "^\\.newsrc-dribble")
                         (mode . newsticker-mode)))
         ("emacs" (or
                   (name . "^\\*scratch\\*$")
                   (name . "^\\*Messages\\*$")))
         ("Files" (filename . ".*"))
         ("File Management" (or
                             (mode . dired-mode)
                             (mode . shell-mode)))
         ("Documentation" (or
                           (mode . Info-mode)
                           (mode . apropos-mode)
                           (mode . woman-mode)
                           (mode . help-mode)
                           (mode . Man-mode)))))))

;;I then load the saved filter group by name in the ibuffer-mode-hook so that a particular filter is always loaded automatically:
(add-hook 'ibuffer-mode-hook 
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-show-empty-filter-groups nil)