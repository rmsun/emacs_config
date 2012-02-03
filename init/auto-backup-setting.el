;; backup policies
;;启用自动备份。
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
;;所有本分文件都放到backups目录中 
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))