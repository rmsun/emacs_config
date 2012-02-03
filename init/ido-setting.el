;;set for ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer t)
(setq ido-confirm-unique-completion nil)
(setq ido-use-filename-at-point t)
(setq ido-show-dot-for-dired t)

(setq
  ido-save-directory-list-file "~/.emacs.d/plugins/cachedate/ido.last"
  ido-ignore-buffers ;;  ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*"))
